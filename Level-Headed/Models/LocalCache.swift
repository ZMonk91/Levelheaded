//  LocalCache.swift
//  Level-Headed
//
//  Created on [Date].
//  Description: The LocalCache class is responsible for maintaining a local copy of the user's settings. It provides methods to update this cache and to commit changes to Firestore, potentially using a batching strategy to minimize network requests.

import Foundation

class LocalCache {
	static let shared = LocalCache()
	private(set) var settings: User.Settings?

	init() { loadCachedSettings() }

	private func loadCachedSettings() {
		// Implement loading logic from UserDefaults or another local storage
		// If no settings are found, set to nil
		if let cachedSettingsData = UserDefaults.standard.data(forKey: "settings"),
		   let cachedSettings = try? JSONDecoder().decode(User.Settings.self, from: cachedSettingsData) {
			self.settings = cachedSettings
		} else {
			self.settings = User.Settings() // Set to default settings
		}
	}

	func updateSettings(_ newSettings: User.Settings) {
		// Update the local cache with new settings
		self.settings = newSettings
		// Save the updated settings to the local storage
		saveCachedSettings()
	}

	private func saveCachedSettings() {
		// Implement saving logic to UserDefaults or another local storage
		if let settingsData = try? JSONEncoder().encode(self.settings) {
			UserDefaults.standard.set(settingsData, forKey: "settings")
		}
	}

	func commitChangesIfNeeded() {
		guard let updatedSettings = settings, settingsHaveChanged(updatedSettings) else { return }

		let settingsDictionary: [String: Any] = [
			"name": updatedSettings.name,
			"darkMode": updatedSettings.darkMode,
			"notifications": ["isEnabled": updatedSettings.notifications.isEnabled]
		]
		FirestoreManager.shared.updateUserSettings(settings: settingsDictionary)
	}

	private func settingsHaveChanged(_ newSettings: User.Settings) -> Bool {
		// Compare newSettings with the settings stored in UserDefaults to determine if there are changes
		if let cachedSettingsData = UserDefaults.standard.data(forKey: "settings"),
		   let cachedSettings = try? JSONDecoder().decode(User.Settings.self, from: cachedSettingsData) {
			return newSettings != cachedSettings
		}
		return true // If there's no cached data, assume changes have occurred
	}



	// Add more methods as needed for local cache management
}


