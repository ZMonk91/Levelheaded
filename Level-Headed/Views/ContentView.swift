//
//  ContentView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//

// ContentView.swift
import SwiftUI

// Main ContentView that hosts other views
struct ContentView: View {
	var body: some View {
		TabView {
			HomeView()
				.tabItem {
					Label("Home", systemImage: "house.fill")
				}
			
			QuestionsView()
				.tabItem {
					Label("Questions", systemImage: "questionmark.circle.fill")
				}
			
			ResponsesView()
				.tabItem {
					Label("Responses", systemImage: "bubble.right.fill")
				}
			
			StatementsView()
				.tabItem {
					Label("Statements", systemImage: "text.bubble.fill")
				}
			
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "gearshape.fill")
				}
		}
	}
}



#Preview {
    ContentView()
}
