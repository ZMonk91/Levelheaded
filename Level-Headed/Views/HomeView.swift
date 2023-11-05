//
//  HomeView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//
// HomeView.swift
import SwiftUI

// HomeView displays the main content of the Home tab
struct HomeView: View {
	@EnvironmentObject var userManager: UserManager

	var body: some View {
		VStack {
			Text("Welcome \(User.shared.settings.name)")
			// Rest of your HomeView content
		}
	}
}




#Preview {
    HomeView()
}
