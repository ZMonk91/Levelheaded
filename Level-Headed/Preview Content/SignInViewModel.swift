import Foundation
import FirebaseAuth
import GoogleSignIn
import FirebaseFirestore

class SignInViewModel: NSObject, ObservableObject {
    
    private var db = Firestore.firestore()
    
    override init() {
        super.init()
        // Configuration is now set in Info.plist
    }
    
    // Method to initiate Google Sign-In
    func signInWithGoogle(presentingViewController: UIViewController) {
        GIDSignIn.sharedInstance.signInWithPresentingViewController(presentingViewController) { signInResult, error in
            guard error == nil else {
                print("Google Sign In Failed: \(error)")
                return
            }
            
            guard let signInResult = signInResult else {
                print("No Google User")
                return
            }
            
            // After a user successfully signs in, get the user's ID token.
            // This token can be used to identify the user to your backend.
            
            signInResult.user.refreshTokensIfNeeded { user, error in
                guard error == nil else {
                    print("Error refreshing token: \(error)")
                    return
                }
                guard let user = user else {
                    print("No user")
                    return
                }
                
                let idToken = user.idToken
                
                tokenSignIn(idToken: idToken)
            }
            
            func tokenSignIn(idToken: String) {
              guard let authData = try? JSONEncoder().encode(["idToken": idToken]) else {
                print("Error encoding auth data")
                return
              }
            }
                
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                               accessToken: user.accessToken)
            
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error = error {
                    print("Firebase Sign In Failed: \(error)")
                } else {
                    print("Logged into Firebase with Google")
                    
                    // Add user to Firestore
                    let userInfo = authResult?.user
                    let email = userInfo?.email ?? ""
                    let name = userInfo?.displayName ?? ""
                    let id = userInfo?.uid ?? ""
                    
                    let user = AppUser(id: id, email: email, name: name)
                    self.addUserToFirestore(user)
                }
            }
        }
    }
    
    private func addUserToFirestore(_ user: AppUser) {
        do {
            let _ = try db.collection("users").document(user.id).setData(from: user)
        } catch let error {
            print("Error writing user to Firestore: \(error)")
        }
    }
}
