//
//  ContentView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
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
