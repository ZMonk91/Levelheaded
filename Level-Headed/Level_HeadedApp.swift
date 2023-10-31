//
//  Level_HeadedApp.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//
import Foundation
import SwiftUI
import Firebase
import FirebaseAuth
import GoogleSignIn

@main
struct Level_HeadedApp: App {
    init() {
        FirebaseApp.configure()
    }
//    // Implement the application:openURL:options: method to handle incoming URLs.
//    func application(_ app: UIApplication, open url: URL,
//                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//      return GIDSignIn.sharedInstance().handle(url)
//    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    GIDSignIn.sharedInstance.handle(url)
                })
                .onAppear() {
                    GIDSignIn.sharedInstance.restorePreviousSignIn()
                }
        }
    }
}
    
