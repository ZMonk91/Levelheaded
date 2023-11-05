//  DisplaySettingsView.swift
//  Level-Headed
//
//  Created on [Date].
//  Description: The DisplaySettingsView binds to the User.shared.settings.darkMode property. The toggle switch uses this binding to update the dark mode setting.

import SwiftUI

struct DisplaySettingsView: View {
	@Binding var darkModeEnabled: Bool

	init() {
		_darkModeEnabled = Binding<Bool>(
			get: { User.shared.settings.darkMode },
			set: { User.shared.settings.updateDarkMode($0) }
		)
	}

	var body: some View {
		Form {
			Toggle(isOn: $darkModeEnabled) {
				Text("Dark Mode")
			}
			// Add more display settings as needed
		}
		.navigationBarTitle("Display")
	}
}

struct DisplaySettingsView_Previews: PreviewProvider {
	static var previews: some View {
		DisplaySettingsView()
	}
}
