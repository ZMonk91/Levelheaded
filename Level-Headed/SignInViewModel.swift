//
//  SignInViewModel.swift
//  Level-Headed
//
//  Created by Zachary Monk on 10/30/23.
//
import Firebase
import GoogleSignIn


//func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
//    if let error = error {
//        print(error.localizedDescription)
//        return
//    }
//
//    guard let authentication = user.authentication else { return }
//    let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
//                                                   accessToken: authentication.accessToken)
//    Auth.auth().signIn(with: credential) { (authResult, error) in
//        if let error = error {
//            print(error.localizedDescription)
//        } else {
//            print("Login Successful.")
//        }
//    }
//}
