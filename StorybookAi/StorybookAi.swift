//
//  StorybookAiApp.swift
//  StorybookAi
//
//  Created by Derek Winnicki on 2022-05-01.
//

import SwiftUI
import RealmSwift

// MARK: MongoDB Realm (Optional)

// The Realm app. Change YOUR_REALM_APP_ID_HERE to your Realm app ID.
// If you don't have a Realm app and don't wish to use Sync for now,
// you can change this to:
//   let app: RealmSwift.App? = nil
let app: RealmSwift.App? = RealmSwift.App(id: "sandbox-lzczy")

@main
struct StorybookAi: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            if let app = app {
                RootView(app: app)
            }
        }
    }
}
