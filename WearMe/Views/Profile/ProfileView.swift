//
//  ProfileView.swift
//  WearMe
//
//  Created by macbook27 on 12/02/24.
//

import SwiftUI

struct ProfileView: View {
    @State var firstName: String = "Sunil"
    @State var  lastName: String = "Kumar"
    @State var  email: String = "sunilkuamr@systango.com"
    @State var  location: String = "indore, MP, India"
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        VStack {
            MenuHeaderView(action: {
                presentSideMenu.toggle()
            }, title: "My Profile")
            .padding(.horizontal, 15)
            ScrollView {
                VStack {
                    ProfileImageView
                        .frame(height: 140)
                        .padding(.bottom, 10)
                       
                    TextFieldView(textfiledvalue: $firstName, title: "First Name", placeholder: "Enter First Name", errorMsg: "")
                        .padding(.top, 20)
                    
                    TextFieldView(textfiledvalue: $lastName, title: "Last Name", placeholder: "Enter Last Name", errorMsg: "")
                        .padding(.top, 20)
                    
                    
                    TextFieldView(textfiledvalue: $email, title: "Email Address", placeholder: "Enter email address", errorMsg: "")
                        .padding(.top, 20)
                    
                    TextFieldView(textfiledvalue: $location, title: "Location", placeholder: "Enter Location", errorMsg: "")
                        .padding(.top, 20)
                    
                    
                    Spacer()
                }
                .padding(.horizontal, 15)
            }
        }
        
 
    }
    
    var ProfileImageView: some View {
        VStack(alignment: .center){
            HStack{
                Spacer()
                Image("profile_pic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.purple.opacity(0.5), lineWidth: 10)
                    )
                    .cornerRadius(50)
                    .overlay(alignment: .bottomTrailing) {
                        Image("edit_profile")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.bottom, -10)
                            .padding(.trailing, 10)
                    }
                   
                Spacer()
            }
            
            Text("Sunil Kumar")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            Text("IOS Developer")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.black.opacity(0.5))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(presentSideMenu: .constant(false))
    }
}
