//
//  GoogleSignInManager.swift
//  WearMe
//
//  Created by macbook27 on 14/02/24.
//

import Foundation
import GoogleSignIn


class GoogleSignInManager: ObservableObject {
//  @Published var profilePicUrl: String = ""
//    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    @Published var user: UserDetails?
    
    init(){
        check()
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let givenName = user.profile?.givenName ?? ""
//            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            let eamil = user.profile?.email ?? ""
//            self.givenName = givenName ?? ""
//            self.profilePicUrl = profilePicUrl
//            self.isLoggedIn = true
            let userId = user.userID ?? ""
            let idToken = user.idToken?.tokenString ?? ""
            print("google token id is \(idToken)")
            self.user =  UserDetails(email: eamil,
                                     first_name: "",
                                     id: userId,
                                     fullName: givenName,
                                     accessToken: idToken)
          } else {
//            self.isLoggedIn = false
//            self.givenName = "Not Logged In"
//            self.profilePicUrl =  ""
        }
    }
    
    //GIDSignIn
    func check(){
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            self.checkStatus()
        }
    }
    
    func signIn(_ completion: @escaping (SocialLoginStatus) -> ()){
       guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            if let error = error {
                self.errorMessage = "error: \(error.localizedDescription)"
            }
            signInResult?.user.refreshTokensIfNeeded { user, error in
                 guard error == nil else {
                     completion(.Failure)
                     return
                 }
                 guard let user = user else { return }
                let idToken = user.idToken?.tokenString ?? ""
                print("google token id is \(idToken)")
                 // Send ID token to backend (example below).
             }
             self.checkStatus()
            completion(.Success)
         }
    }
  

    func signOut(){
        GIDSignIn.sharedInstance.signOut()
        self.checkStatus()
    }
}
 
