//
//  AppleLoginManager.swift
//  AppleLogin
//
//

import Foundation
import AuthenticationServices
protocol AppleLoginDelegate: AnyObject {
    func onLoginStatus(loginStatus: SocialLoginStatus)
}

class AppleLoginManager: NSObject, ASAuthorizationControllerDelegate, ObservableObject {
    @Published var user: UserDetails?
    weak var delegate: AppleLoginDelegate?
    
    func authorizationController(controller: ASAuthorizationController,
                                 didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIdCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // User Identifier
            let userIdentifier = appleIdCredential.user
            print("User Identifier: \(userIdentifier)")

            // User Email
            var emailStr = ""
            if let email = appleIdCredential.email {
                emailStr = email
            }else {
                print("error got on email finding")
            }

            // User Full Name
            var fullNameStr = ""
            if let fullName = appleIdCredential.fullName {
                let firstName = fullName.givenName ?? ""
                let lastName = fullName.familyName ?? ""
                fullNameStr = "\(firstName) \(lastName)"
                print("User Full Name: \(firstName) \(lastName)")
            }

            // Identity Token
            guard let token = appleIdCredential.identityToken?.base64EncodedString() else {
                return
            }
            print("Identity Token: \(token)")
            user = UserDetails(email: emailStr, first_name: "", id: userIdentifier, fullName: fullNameStr, accessToken: token)
            delegate?.onLoginStatus(loginStatus: .Success)
        }
    }

    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        delegate?.onLoginStatus(loginStatus: .Failure)
        print(error)
    }
    
     func performAppleSignIn() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
         request.requestedScopes = [.fullName, .email]
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
}
