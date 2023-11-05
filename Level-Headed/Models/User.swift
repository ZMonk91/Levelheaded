import Foundation
import Firebase

class User {
	static let shared = User()
	var settings = Settings()

	class Settings: Codable {
		var name: String = "Default Name" {
			didSet { LocalCache.shared.updateSettings(self) }
		}
		var darkMode: Bool = false {
			didSet { LocalCache.shared.updateSettings(self) }
		}
		var notifications: NotificationSettings {
			didSet { LocalCache.shared.updateSettings(self) }
		}
		

		// Define the nested NotificationSettings class
		class NotificationSettings: Codable {
			var isEnabled: Bool = false

			init(isEnabled: Bool = false) {
				self.isEnabled = isEnabled
			}
		}

		// Custom initializer from Decoder to handle the nested structure
		required init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			// Decode `darkMode` directly since it's not nested
			darkMode = try container.decode(Bool.self, forKey: .darkMode)
			// Decode `notifications` which is nested
			notifications = try container.decode(NotificationSettings.self, forKey: .notifications)
		}
		
		// Encode function if you need to encode the settings back to JSON
		func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(darkMode, forKey: .darkMode)
			try container.encode(notifications, forKey: .notifications)
		}
		
		// Initializer to set default values
		init(darkMode: Bool = false, notifications: NotificationSettings = NotificationSettings(isEnabled: false)) {
			self.darkMode = darkMode
			self.notifications = notifications
		}


		// Update methods
		func updateName(_ newName: String) {
			self.name = newName
			LocalCache.shared.commitChangesIfNeeded()
		}

		func updateDarkMode(_ enabled: Bool) {
			self.darkMode = enabled
			LocalCache.shared.commitChangesIfNeeded()
		}

		func updateNotificationsEnabled(_ enabled: Bool) {
			self.notifications.isEnabled = enabled
			LocalCache.shared.commitChangesIfNeeded()
		}
	}
	
	// Define CodingKeys at the level of Settings to match the JSON structure
	enum CodingKeys: String, CodingKey {
		case darkMode = "darkMode"
		case notifications = "notifications"
	}


	// Sync with Firestore
	func syncWithFirestore() {
		let db = Firestore.firestore()
		if let userId = Auth.auth().currentUser?.uid {
			db.collection("users").document(userId).getDocument { document, error in
				if let document = document, document.exists {
					do {
						// Make sure to decode the "settings" field of the document
						if let settingsData = document.data()?["settings"] as? [String: Any] {
							let jsonData = try JSONSerialization.data(withJSONObject: settingsData, options: [])
							let userSettings = try JSONDecoder().decode(User.Settings.self, from: jsonData)
							self.settings = userSettings
							LocalCache.shared.updateSettings(userSettings)
						} else {
							print("Settings data not found")
							// Handle the case where settings are not found
						}
					} catch {
						print("Error decoding user settings: \(error)")
						// Handle decoding error
					}
				} else {
					print("Document does not exist")
					// Handle the case where the document doesn't exist
				}
			}
		}
	}


	// Add more user-related methods as needed
}

extension User.Settings: Equatable {
	static func == (lhs: User.Settings, rhs: User.Settings) -> Bool {
		return lhs.name == rhs.name &&
			   lhs.darkMode == rhs.darkMode &&
			   lhs.notifications == rhs.notifications
	}
}

extension User.Settings.NotificationSettings: Equatable {
	static func == (lhs: User.Settings.NotificationSettings, rhs: User.Settings.NotificationSettings) -> Bool {
		return lhs.isEnabled == rhs.isEnabled
	}
}
