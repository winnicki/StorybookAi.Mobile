//
//  AppleSignInView.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2023-01-30.
//

import SwiftUI
import AuthenticationServices
import RealmSwift
import Realm

/// Your MongoDB Realm App ID
let appId = "sandbox-lzczy"

struct AppleSignInView: View {
    @State var accessToken: String = ""
    @State var error: String = ""

    var body: some View {
        VStack {
            SignInWithAppleView(accessToken: $accessToken, error: $error)
                .frame(width: 200, height: 50, alignment: .center)
            Text(self.accessToken)
            Text(self.error)
        }
    }
}

class SignInCoordinator: ASLoginDelegate {
    
    var parent: SignInWithAppleView
    var app: RLMApp

    init(parent: SignInWithAppleView) {
        self.parent = parent
        app = App(id: appId)
        app.authorizationDelegate = self
    }

    @objc func didTapLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        app.setASAuthorizationControllerDelegate(for: authorizationController)
        authorizationController.performRequests()
    }

    func authenticationDidComplete(error: Error) {
        parent.error = error.localizedDescription
    }

    func authenticationDidComplete(user: RLMUser) {
        parent.accessToken = user.accessToken ?? "Could not get access token"
    }
}

struct SignInWithAppleView: UIViewRepresentable {
    @Binding var accessToken: String
    @Binding var error: String

    func makeCoordinator() -> SignInCoordinator {
        return SignInCoordinator(parent: self)
    }

    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        let button = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        button.addTarget(context.coordinator, action: #selector(context.coordinator.didTapLogin), for: .touchUpInside)
        return button
    }

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppleSignInView()
    }
}
