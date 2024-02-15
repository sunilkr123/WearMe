//
//  ForgotPasswordView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct ForgotPasswordView: View {
    @ObservedObject var forgotPasswordVM = ForgotPasswordViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    HeaderView {
                        print("tapped on back button here")
                    }
                    TitleView(title: "Forgot Password", subtitle: "Enter your Email account to reset your password")
                    
                    TextFieldView(textfiledvalue: $forgotPasswordVM.email, title: "Email Address", placeholder: "Enter email", errorMsg: forgotPasswordVM.emailPrompt)
                        .padding(.vertical, 20)
                     ButtonView(title: "Reset password"){
                         forgotPasswordVM.doForgotPassword()
                    }
                   Spacer()
                }
                .padding(.horizontal, 20)
            }
            if forgotPasswordVM.isForgotpassComplete && forgotPasswordVM.inputValidate{
                Color("pop_up_bg")
                    .ignoresSafeArea()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                SuccessPopUpView()
                    .padding(.horizontal, 15)
            }
            
        }
        .navigationBarHidden(true)
    
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
