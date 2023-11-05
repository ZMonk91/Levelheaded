////
////  SettingsView.swift
////  Level-Headed
////
////  Created by Zachary Monk on 10/31/23.
//// Displays the main categories to choose from in the Settings tab
//
//import SwiftUI
//
//struct SettingsMainView: View {
//	@EnvironmentObject var userManager: UserManager
//	var body: some View {
//		NavigationView {
//			List {
//				NavigationLink(destination: GeneralSettingsView()) {
//					Text("General")
//				}
//				NavigationLink(destination: DisplaySettingsView()) {
//					Text("Display")
//				}
//				NavigationLink(destination: ViewSettingsView()) {
//					Text("Views")
//				}
//			}
//			.navigationBarTitle("Settings")
//			.onDisappear {
//				SettingsCache.shared.commitChanges()
//			}
//		}
//	}
//}
//
//struct SettingsMainView_Previews: PreviewProvider {
//	static var previews: some View {
//		SettingsMainView()
//	}
//}
