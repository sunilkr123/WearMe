//
//  LoginViewModel.swift
//  WearMe
//
//  Created by macbook27 on 13/02/24.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var inputValidate: Bool = false
    @Published var isNavigateToRegister: Bool = false
    @Published var isNavigateToForgotPass: Bool = false
    @Published var isNavigateToHome: Bool = false
    
    @ObservedObject var facbookManger = FacebookLoginManager()
    @ObservedObject var appleLoginManager = AppleLoginManager()
    @ObservedObject var googleVM =  GoogleSignInManager()
    
    init() {
        appleLoginManager.delegate = self
    }
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", Constant.emailRegex)
        if inputValidate {
            return passwordTest.evaluate(with: password)
        } else {
            return !password.isEmpty ? passwordTest.evaluate(with: password) : true
        }
        
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", Constant.passwordRegex)
        if inputValidate {
            return emailTest.evaluate(with: email)
        } else {
            return !email.isEmpty ? emailTest.evaluate(with: email) : true
        }
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return "Enter a valid email address"
        }
    }
    
    var passwordPrompt: String {
        if isPasswordValid() {
            return ""
        } else {
            return "Must be between 8 and 15 characters containing at least one number and one capital letter"
        }
    }
    
    var isLoginComplete: Bool {
        if !isPasswordValid() ||
        !isEmailValid(){
            return false
        }
        return true
    }
    

    func doLogin()  {
        inputValidate = true
        isNavigateToHome =  isLoginComplete
    }
    
    func facebookLogin()  {
        facbookManger.facebookLogin { loginStatuc in
            switch(loginStatuc){
            case .Success:
                self.isNavigateToHome = true
            case .Cancelled:
                self.isNavigateToHome = false
            case .Failure:
                self.isNavigateToHome = false
            }
        }
    }
    
    func appleLogin() {
        appleLoginManager.performAppleSignIn()
    }
    
    func loginWithGoogle()  {
        googleVM.signIn { loginStatus in
            self.isNavigateToHome = loginStatus == .Success
        }
    }
    
}

 

extension LoginViewModel: AppleLoginDelegate{
    func onLoginStatus(loginStatus: SocialLoginStatus) {
        self.isNavigateToHome = loginStatus == .Success
     }
}
