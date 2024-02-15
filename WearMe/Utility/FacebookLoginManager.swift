//
//  FacebookLoginManager.swift
//  WearMe
//
//  Created by macbook27 on 15/02/24.
//

import Foundation
import FacebookLogin
enum SocialLoginStatus {
    case Failure
    case Success
    case Cancelled
}

class FacebookLoginManager: ObservableObject {
    @Published var user: UserDetails?
    let loginManager = LoginManager()
    
    func facebookLogin(_ completion: @escaping (SocialLoginStatus) -> ())  {
        loginManager.logIn(permissions: [.publicProfile, .email], viewController: nil) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
                completion(.Failure)
            case .cancelled:
                print("User cancelled login.")
                completion(.Cancelled)
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in! \(grantedPermissions) \(declinedPermissions) \(accessToken)")
                GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, email"]).start(completionHandler: { (connection, result, error) -> Void in
                    if (error == nil){
                        let fbDetails = result as! NSDictionary
                        print(fbDetails)
                        let fbUserId = (fbDetails["id"]as? String) ?? ""
                        let email = (fbDetails["email"] as? String) ?? ""
                        let firstName = (fbDetails["first_name"] as? String) ?? ""
                        let fullName = (fbDetails["name"] as? String) ?? ""
                        let fbAccessToken = AccessToken.current?.tokenString ?? ""
//                        let fbResult = "id=\(fbUserId)&accessToken=\(fbAccessToken)"
                        self.user = UserDetails(email: email, first_name: firstName, id: fbUserId, fullName: fullName, accessToken: fbAccessToken)
                        completion(.Success)
                    }
                })
            }
        }
    }
}
