//
//  MemoAppAppleWatchApp.swift
//  MemoAppAppleWatch WatchKit Extension
//
//  Created by emm on 24/02/2021.
//

import SwiftUI

@main
struct MemoAppAppleWatchApp: App {
    
    let container = PersistentController.shared.container
    
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                   
            }
            .environment(\.managedObjectContext, container.viewContext)
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
