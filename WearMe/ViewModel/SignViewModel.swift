//
//  SignViewModel.swift
//  WearMe
//
//  Created by macbook27 on 13/02/24.
//

import SwiftUI

class RegisterViewModel: ObservableObject {
    @Published var fullname: String = ""
    @Published var email: String = ""
    @Published var passowrd: String = ""
    @Published var inputValidate: Bool = false

    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", Constant.emailRegex)
        if inputValidate {
            return passwordTest.evaluate(with: passowrd)
        } else {
            return !passowrd.isEmpty ? passwordTest.evaluate(with: passowrd) : true
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
    
    
    func isValidFullname() -> Bool {
        if inputValidate {
            return fullname.count < 15 && fullname.count >= 2
        } else {
            return !fullname.isEmpty ? (fullname.count < 15 && fullname.count >= 2) : true
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
            return "Must be between 2 and 15 characters containing at least one number and one capital letter"
        }
    }
    
    var fullNamePrompt: String {
        if fullname.isEmpty  {
            return inputValidate ? "Please enter your full name" : ""
        } else if !isValidFullname() {
            return "Full name must be between 2 and 15 characters"
        } else {
            return ""
        }
    }
    
    
    var isRegisterComplete: Bool {
        if !isEmailValid() || !isPasswordValid() || !isValidFullname() {
            return false
        } else {
          return true
        }
    }
    
    func doRegister()  {
        inputValidate = true
       print(isRegisterComplete)
    }
    
}
 
 
