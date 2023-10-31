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
        // TabView to hold multiple tabs
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            // Add other views here
        }
    }
}


#Preview {
    ContentView()
}
