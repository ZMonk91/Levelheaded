//  SettingsView.swift
//  Level-Headed
//
//  Created on [Date].
//  Description: A view that displays the settings categories and navigates to detailed settings views.

import SwiftUI

struct SettingsView: View {
	var body: some View {
		NavigationView {
			List {
				NavigationLink(destination: GeneralSettingsView()) {
					Text("General")
				}
				NavigationLink(destination: DisplaySettingsView()) {
					Text("Display")
				}
				NavigationLink(destination: NotificationsSettingsView()) {
					Text("Notifications")
				}
				// Add more categories as needed
			}
			.navigationBarTitle("Settings")
		}
	}
}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
	}
}
