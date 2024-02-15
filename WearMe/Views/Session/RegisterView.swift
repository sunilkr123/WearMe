//
//  RegisterView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var registerVM = RegisterViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                HeaderView {
                    print("back button tapped")
                }
                TitleView(title: "Register Account", subtitle: "Fill your details or continue with social media")
                TextFieldView(textfiledvalue: $registerVM.fullname, title: "Your Name", placeholder: "Enter name", errorMsg: registerVM.fullNamePrompt)
                    .padding(.top, 20)
                TextFieldView(textfiledvalue: $registerVM.email, title: "Email Address", placeholder: "Enter email id", errorMsg: registerVM.emailPrompt)
                    .padding(.top, 20)
                PasswordFiledView(textfiledvalue: $registerVM.passowrd,title: "Passowrd", errorMsg: registerVM.passwordPrompt)
                    .padding(.top, 15)
                ButtonView(title: "Sign in"){
                    registerVM.doRegister()
                    if registerVM.isRegisterComplete{
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                .frame(height: 50)
                .padding(.vertical, 15)
                SocialLoginButtonView(action: {
                     
                }, icon: "google", title: "Sign In with Google ", bgColor: Color("text_filed_bg"))
                .frame(height: 50)
                 Spacer()
              }
            .padding(.horizontal, 15)
        }
        .overlay(alignment: .bottom, content: {
            HStack {
                Text("Already Have Account?")
                    .font(.system(size: 15))
                    .foregroundColor(.black.opacity(0.7))
                Button {
                    print("tapped on create account")
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Log In")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                }
            }
            .background {
                Color.white
            }
            .frame(height: 30)
            
        })
        .navigationBarHidden(true)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
