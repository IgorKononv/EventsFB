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
