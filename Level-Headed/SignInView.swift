//
//  SignInView.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//
import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct SignInView: View {
    var body: some View {
        VStack {
            Text("Level-Headed")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 50)
            GoogleSignInButton(action: handleSignInButton)
                .frame(width: 230, height: 48)
        }
    }

    func handleSignInButton() {
        guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}

        GIDSignIn.sharedInstance.signIn(
            withPresenting: presentingViewController) { signInResult, error in
                guard let result = signInResult else {
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    return
                }
                let content = ContentView()
                let user = result.user
                let email = user.profile?.email
                let name = user.profile?.name
                let defaults = UserDefaults.standard
                
                defaults.set(email, forKey: "email")
                defaults.set(name, forKey: "name")
                defaults.set(true, forKey: "isSignedIn")
                
                if defaults.bool(forKey: "isSignedIn") {
                    // display content view
                    let content = ContentView()
                    let rootViewController = UIHostingController(rootView: content)
                    UIApplication.shared.windows.first?.rootViewController = rootViewController
                    
                }
                
                
//                if result.signedIn {
                    
//                    rootViewController.displayContentController(content)
//                }
                
            }
    }
    
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
