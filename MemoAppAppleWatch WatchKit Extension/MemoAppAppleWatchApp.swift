//
//  MemoAppAppleWatchApp.swift
//  MemoAppAppleWatch WatchKit Extension
//
//  Created by emm on 24/02/2021.
//

import SwiftUI

@main
struct MemoAppAppleWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
