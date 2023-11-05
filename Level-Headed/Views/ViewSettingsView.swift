//
//  ViewSettingsView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 11/1/23.
//

import SwiftUI

struct ViewSettingsView: View {
	var body: some View {
		List {
			// Placeholder for future settings
			Text("Placeholder")
		}
		.navigationBarTitle("Views")
		.listStyle(GroupedListStyle())
		.navigationBarItems(trailing: Button("Update") {
			// Logic to update Firestore fields
		})

	}
}


#Preview {
    ViewSettingsView()
}
