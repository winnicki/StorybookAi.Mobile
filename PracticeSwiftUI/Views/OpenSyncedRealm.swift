//
//  OpenSyncedRealm.swift
//  PracticeSwiftUI
//
//  Created by Derek Winnicki on 2022-06-24.
//

import SwiftUI
import RealmSwift

/// This view opens a synced realm.
struct OpenSyncedRealmView: View {
    
    // Use AsyncOpen to download the latest changes from
    // your Realm app before opening the realm.
    // Leave the `partitionValue` an empty string to get this
    // value from the environment object passed in above.
    @AsyncOpen(appId: "ama-kgtmc", partitionValue: "PUBLIC", timeout: 4000) var asyncOpen
    
    var body: some View {
        
        switch asyncOpen {
            
            // Starting the Realm.asyncOpen process.
            // Show a progress view.
            case .connecting:
                ProgressView()
            
            // Waiting for a user to be logged in before executing
            // Realm.asyncOpen.
            case .waitingForUser:
                ProgressView("Waiting for user to log in...")
            
            // The realm has been opened and is ready for use.
            // Show the content view.
            case .open(let realm):
            HomeView(topics:Topic.stubMultiple)
//                HomeView(topics: realm.objects(Topic.self))
            
            // The realm is currently being downloaded from the server.
            // Show a progress view.
            case .progress(let progress):
                ProgressView(progress)
            
            // Opening the Realm failed.
            // Show an error view.
            case .error(let error):
                ErrorView(error: error)
        }
        
    }
}

struct OpenSyncedRealm_Previews: PreviewProvider {
    static var previews: some View {
        OpenSyncedRealmView()
    }
}
