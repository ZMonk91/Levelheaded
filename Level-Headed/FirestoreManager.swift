// FirestoreManager.swift
// Date: 11/02/2023
// Description: Utility class for managing Firestore operations.

import FirebaseAuthUI
import FirebaseFirestore

class FirestoreManager {
	static let shared = FirestoreManager()
	private var db = Firestore.firestore()
	
	func updateUserSettings(settings: [String: Any]) {
		guard let userId = Auth.auth().currentUser?.uid else { return }
		
		var updateData: [String: Any] = [:]
		if let name = settings["name"] as? String {
			updateData["name"] = name
		}
		if let darkMode = settings["darkMode"] as? Bool {
			updateData["darkMode"] = darkMode
		}
		if let notifications = settings["notifications"] as? [String: Bool], let isEnabled = notifications["isEnabled"] {
			updateData["settings.notifications.isEnabled"] = isEnabled
		}
		
		db.collection("users").document(userId).updateData(updateData) { error in
			if let error = error {
				print("Error updating settings: \(error)")
				// Handle error appropriately
			}
		}
	}
	
	// Add other Firestore operations here
}
