//
//  ForgotPassowrd.swift
//  WearMe
//
//  Created by macbook27 on 13/02/24.
//

import Foundation
class ForgotPasswordViewModel: ObservableObject {
    @Published var email = ""
    @Published var inputValidate: Bool = false
    
  
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
    
    var isForgotpassComplete: Bool {
       return isEmailValid()
    }
    
    func doForgotPassword()  {
        inputValidate = true
        print(isForgotpassComplete)
    }
    
}
