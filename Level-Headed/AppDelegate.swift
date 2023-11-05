//
//  AppDelegate.swift
//  Level-Headed
//
// Description: AppDelegate for handling app lifecycle events.
//
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		User.shared.syncWithFirestore()
		return true
	}
}
