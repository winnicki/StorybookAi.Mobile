//
//  LogoutButton.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-06-24.
//

import Foundation
import SwiftUI
import RealmSwift

/// A button that handles logout requests.
struct LogoutButton: View {
    
    @EnvironmentObject private var realmApp: RealmSwift.App
    @State var isLoggingOut = false
    
    var body: some View {
        Button("Log Out") {
            guard let user = realmApp.currentUser else {
                return
            }
            isLoggingOut = true
            user.logOut() { error in
                isLoggingOut = false
                // Other views are observing the app and will detect
                // that the currentUser has changed. Nothing more to do here.
                print("Logged out")
            }
        }.disabled(realmApp.currentUser == nil || isLoggingOut)
    }
}
