import Combine
import FirebaseAuth
import FirebaseFirestore

class UserManager: ObservableObject {
	private var db = Firestore.firestore()

	init() {
		Auth.auth().addStateDidChangeListener { [weak self] _, user in
			if let user = user {
				self?.fetchUserFromFirestore(id: user.uid)
			} else {
				// Handle user sign-out if needed
			}
		}
	}

	func fetchUserFromFirestore(id: String) {
		db.collection("users").document(id).getDocument { document, error in
			if let error = error {
				print("Error fetching user: \(error)")
				return
			}

			if let document = document, document.exists {
				do {
					// Parse the document data to update the User singleton
					let data = document.data() ?? [:]
					User.shared.settings.name = data["name"] as? String ?? "Default Name"
					User.shared.settings.darkMode = data["darkMode"] as? Bool ?? false
					if let settings = data["settings"] as? [String: Any],
					   let notifications = settings["notifications"] as? [String: Any] {
						User.shared.settings.notifications.isEnabled = notifications["isEnabled"] as? Bool ?? false
					}
					// Update the local cache with the fetched settings
					LocalCache.shared.updateSettings(User.shared.settings)
				} catch {
					print("Error decoding user: \(error)")
				}
			} else {
				print("User does not exist. Creating a new user document.")
				// Handle creating a new user document if necessary
			}
		}
	}

	// Implement sign-out method and other user-related operations here
}
