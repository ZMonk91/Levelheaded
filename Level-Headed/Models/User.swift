// User.swift
// Date: 11/02/2023
// Description: Model representing the user and their settings.

import Foundation

class User {
	static var current = User()
	
	class Settings {
		var darkMode: Bool {
			get { LocalCache.shared.settings["darkMode"] as? Bool ?? false }
			set { LocalCache.shared.settings["darkMode"] = newValue }
		}
		
		// Add other settings here
		
		func update() {
			LocalCache.shared.update()
		}
	}
	
	var settings = Settings()
	
	// Add other categories like Questions, etc. here
	
	init() {
		// Initialization logic, possibly fetching from Firestore
	}
	
	// Add methods for user-related operations here
}
