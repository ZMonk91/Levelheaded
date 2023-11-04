//
//  SettingsView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/31/23.
//

import SwiftUI

// HomeView displays the main content of the Home tab
struct SettingsView: View {
	@EnvironmentObject var userManager: UserManager
	var body: some View {
	NavigationView {
		List {
			NavigationLink(destination: GeneralSettingsView()) {
				Text("General")
			}
			NavigationLink(destination: DisplaySettingsView()) {
				Text("Display")
			}
			NavigationLink(destination: ViewSettingsView()) {
				Text("Views")
			}
		}
		.navigationBarTitle("Settings")
	}
}
}


#Preview {
	SettingsView()
}
