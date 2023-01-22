//
//  RootView.swift
//  PracticeSwiftUI
//
//  Created by Derek Winnicki on 2022-06-27.
//

import SwiftUI
import RealmSwift

struct RootView: View {
    
    // Observe the Realm app object in order to react to login state changes.
    @ObservedObject var app: RealmSwift.App
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    
    var body: some View {
        if let user = app.currentUser {
            
            ZStack(alignment: .bottom) {
                
                switch selectedTab {
                case .home:
                    HomeView(topics:Topic.stubMultiple).environment(
                        \.realmConfiguration,
                         user.configuration(partitionValue: "PUBLIC"))
                case .search:
                    EmptyView()
                case .profile:
                    EmptyView()
                }
                
                TabBar()
            }
        }
        else {
            LoginView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RootView(app:RealmSwift.App(id: "ama-kgtmc"))
            RootView(app:RealmSwift.App(id: "ama-kgtmc"))
                .preferredColorScheme(.dark)
                .previewDevice("iPhone 13 mini")
        }
    }
}
