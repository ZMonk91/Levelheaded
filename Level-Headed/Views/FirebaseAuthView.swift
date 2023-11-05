//
//  FirebaseAuthView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//
import SwiftUI
import FirebaseAuthUI
import FirebaseGoogleAuthUI
import FirebaseOAuthUI

struct FirebaseAuthView: UIViewControllerRepresentable {
	
	func makeUIViewController(context: Context) -> UINavigationController {
		let authUI = FUIAuth.defaultAuthUI()!
		let googleProvider = FUIGoogleAuth(authUI: authUI)
		authUI.providers = [googleProvider]
		let authViewController = authUI.authViewController()
		return authViewController
	}
	
	func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
		// Update code if needed
	}
}
