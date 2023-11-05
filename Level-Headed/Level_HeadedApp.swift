// Description: Main entry point for the SwiftUI app.
import SwiftUI
import Firebase
import FirebaseAuthUI

@main
struct Level_HeadedApp: App {
	@StateObject var userManager = UserManager()
	@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

	init() {
		// Configure Firebase
		FirebaseApp.configure()
	}

	var body: some Scene {
		WindowGroup {
			// Check if the user is signed in by verifying if a user ID exists
			if Auth.auth().currentUser != nil {
				ContentView()
			} else {
				NavigationView {
					FirebaseAuthView()
				}
			}
		}
		.environmentObject(userManager)
	}
}
