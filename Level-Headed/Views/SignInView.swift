//
//  SignInView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//
import SwiftUI

struct SignInView: View {
	var body: some View {
		NavigationView {
			VStack {
				Text("Welcome to Level-Headed")
					.font(.largeTitle)
					.padding(.bottom, 20)
				
				Text("Please sign in to continue")
					.font(.headline)
					.padding(.bottom, 50)
				
				// Embed the FirebaseAuthView
				FirebaseAuthView()
					.frame(width: 300, height: 50)
				
				Spacer()
			}
		}
	}
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
