// NotificationsSettingsView.swift
// Date: 11/02/2023
// Description: View for managing notification settings.

import SwiftUI

struct NotificationsSettingsView: View {
	@State private var notificationsEnabled: Bool = User.shared.settings.notifications.isEnabled

	var body: some View {
		Form {
			Toggle(isOn: $notificationsEnabled) {
				Text("Enable Notifications")
			}
			.onChange(of: notificationsEnabled) { newValue in
				User.shared.settings.updateNotificationsEnabled(newValue)
			}
		}
		.navigationBarTitle("Notifications", displayMode: .inline)
	}
}

// Preview for SwiftUI Canvas
struct NotificationsSettingsView_Previews: PreviewProvider {
	static var previews: some View {
		NotificationsSettingsView()
	}
}
