////
////  AuthenticationViewModel.swift
////  Level-Headed
////
////  Created by Zachary Monk on 10/30/23.
////
//
//import FirebaseCore
//import FirebaseAuth
//import GoogleSignIn
//
//class AuthenticationViewModel: ObservableObject {
//    
//    enum SignInState {
//        case signedIn
//        case signedOut
//    }
//    
//    @Published var signInState: SignInState = .signedOut
//    
//    func signIn() {
//      // 1
//      if GIDSignIn.sharedInstance.hasPreviousSignIn() {
//        GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
//            authenticateUser(for: user, with: error)
//        }
//      } else {
//        // 2
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        
//        // 3
//        let configuration = GIDConfiguration(clientID: clientID)
//        
//        // 4
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//        guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
//        
//        // 5
//        GIDSignIn.sharedInstance.signIn(with: configuration, presenting: rootViewController) { [unowned self] user, error in
//          authenticateUser(for: user, with: error)
//        }
//      }
//    }
//
//}
