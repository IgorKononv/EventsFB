//
//  EventsFBApp.swift
//  EventsFB
//
//  Created by Igor Kononov on 20.12.2022.
//

import SwiftUI
import FBSDKCoreKit

@main
struct EventsFBApp: App {
    init() {
        @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return ApplicationDelegate.shared.application(app, open: url, options: options)
    }
}
