////
////  UserSettings.swift
////  Level-Headed
////
////  Created by Zachary Monk on 11/1/23.
////
//import SwiftUI
//import Firebase
//
//class UserSettings {
////	static let shared = UserSettings()
////	private let defaults = UserDefaults.standard
//	var id: String
//	var displayName: String
//	var lastLogin: Date
//	var darkModeEnabled: Bool
//	
//	func updateValue(forKey key: UserSettingsKey, value: Any) {
//		switch key {
//			case .displayName:
//				displayName = value as? String ?? displayName
//			case .darkModeEnabled:
//				darkModeEnabled = value as? Bool ?? darkModeEnabled
//		}
//	}
//	
//	var dictionary: [String: Any] {
//		// Convert the settings to a dictionary format that Firestore can use
//		return [
//			"name": displayName,
//			"darkmode": darkModeEnabled
//		]
//	}
//	
//	static func loadFromCache() -> UserSettings? {
//		// Load the cached settings, if available
//		guard let userId = Auth.auth().currentUser?.uid else {
//			return nil
//		}
//	}
//	
//	static func defaultSettings() -> UserSettings {
//		// Return a UserSettings object with default values
//		return UserSettings(id: Auth.auth().currentUser?.uid ?? "",
//							displayName: Auth.auth().currentUser?.displayName ?? "User",
//							darkModeEnabled: false)
//		
//	}
//}
//
//enum UserSettingsKey {
//	case displayName
//	case darkModeEnabled
//}
//	
////	var displayName: String {
////		get {
////			return defaults.string(forKey: "displayName") ?? "User"
////		}
////		set {
////			defaults.set(newValue, forKey: "displayName")
////		}
////	}
////	
////	var darkmode: Bool {
////		get {
////			return defaults.bool(forKey: "darkmode") ?? false
////		}
////		set {
////			defaults.set(newValue, forKey: "darkmode")
////		}
////	}
//	
//	// Add other user settings as needed
//	
//	/// Sync cached data with Firestore on app launch
////	func syncWithFirestore() {
////		if let userId = Auth.auth().currentUser?.uid {
////			let db = Firestore.firestore()
////			db.collection("users").document(userId).getDocument { document, error in
////				if let document = document, document.exists {
////					self.displayName = document.get("name") as? String ?? "User"
////					self.darkmode = document.get("darkmode") as? Bool ?? false
////					// Sync other settings as needed
////				}
////			}
////		}
////	}
////}
