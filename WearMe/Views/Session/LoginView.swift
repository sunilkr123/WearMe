//
//  LoginView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var loginVM = LoginViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                HeaderView {
                print("back button tapped")
                }
                
                TitleView(title: "Hello Again!", subtitle: "Fill your details or continue with social media")
                
                TextFieldView(textfiledvalue: $loginVM.email, title: "Email Address", placeholder: "Enter email", errorMsg: loginVM.emailPrompt)
                    .padding(.top, 20)
                
                PasswordFiledView(textfiledvalue: $loginVM.password, title: "Passowrd", errorMsg: loginVM.passwordPrompt)
                    .padding(.top, 15)
                HStack{
                    Spacer()
                    Button {
                        print("Clicked on recover password")
                            loginVM.isNavigateToForgotPass = true
                    } label: {
                        Text("Recover Passowrd")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    
                }
                ButtonView(title: "Sign in") {
                    loginVM.doLogin()
                }
                .frame(height: 50)
                .padding(.vertical, 15)
                
                SocialLoginButtonView(action: {
                    loginVM.loginWithGoogle()
                }, icon: "google", title: "Sign In with Google ", bgColor: Color("text_filed_bg"))
                .shadow(radius: 10)
                .frame(height: 50)
                .padding(.bottom, 15)
                
                SocialLoginButtonView(action: {
                    loginVM.appleLogin()
                }, icon: "apple", title: "Sign In with Apple ", bgColor: Color.black, forGroundColor: .white)
                .frame(height: 50)
                .padding(.bottom, 15)
                
                SocialLoginButtonView(action: {
                    loginVM.facebookLogin()
                }, icon: "facebook", title: "Facebook Login ", bgColor: Color.blue, forGroundColor: .white)
                .frame(height: 50)
                
                HStack {
                    Text("New user?")
                        .font(.system(size: 15))
                        .foregroundColor(.black.opacity(0.7))
                    Button {
                        loginVM.isNavigateToRegister = true
                    } label: {
                        Text("Create Account")
                            .font(.system(size: 15))
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                    }
                }
                .padding(.bottom, 10)
            }
            .padding(.horizontal, 15)
        }
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $loginVM.isNavigateToRegister) {
            RegisterView()
        }
        .navigationDestination(isPresented: $loginVM.isNavigateToForgotPass) {
            ForgotPasswordView()
        }
        .navigationDestination(isPresented: $loginVM.isNavigateToHome) {
            BotttomTavView()
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
