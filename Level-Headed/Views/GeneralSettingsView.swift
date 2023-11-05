//  GeneralSettingsView.swift
//  Level-Headed
//
//  Created on [Date].
//  Description: The GeneralSettingsView binds directly to the User.shared.settings.name property. When the text field is edited, it calls the updateName method on the User.Settings class, which updates both the local user state and the local cache.

import SwiftUI

struct GeneralSettingsView: View {
	@Binding var displayName: String

	init() {
		_displayName = Binding<String>(
			get: { User.shared.settings.name },
			set: { User.shared.settings.updateName($0) }
		)
	}

	var body: some View {
		Form {
			Section(header: Text("Profile")) {
				TextField("Display Name", text: $displayName)
			}
			// Add more general settings as needed
		}
		.navigationBarTitle("General")
	}
}

struct GeneralSettingsView_Previews: PreviewProvider {
	static var previews: some View {
		GeneralSettingsView()
	}
}
