//
//  GoogleButtonView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct SocialLoginButtonView: View {
    var action: (() -> Void)?
    var icon: String = "google"
    var title: String = "Sign In with Google "
    var bgColor: Color = Color("text_filed_bg")
    var forGroundColor: Color = .black
    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                action?()
            }, label: {
                HStack {
                    Image(icon)
                        .resizable()
                        .frame(width: 25, height: 25)
                    Text(title)
                        .foregroundColor(forGroundColor)
                }
                .frame(width: geometry.size.width, height: 45)
                .background(
                    bgColor
                )
            })
            .cornerRadius(15)
          
        }
       
    }
}

struct SocialLoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SocialLoginButtonView()
    }
}
