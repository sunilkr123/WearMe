//
//  PasswordFiledView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct PasswordFiledView: View {
    @Binding var textfiledvalue: String
    @State var isSecure: Bool = true
    var title: String = ""
    var errorMsg: String = "Please enter emial id"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            HStack {
                if isSecure {
                    SecureField("Enter password", text: $textfiledvalue)
                } else {
                    TextField("Enter password", text: $textfiledvalue)
                }
            }
            .frame(width: .none, height: 50)
            .font(.system(size: 16, weight: .regular))
            .padding(.horizontal)
            .background {
                Color("text_filed_bg")
            }
            .cornerRadius(20)
            .overlay(alignment: .trailing, content: {
                Button {
                    isSecure.toggle()
                } label: {
                    Image(isSecure ? "view" : "hide")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding()
                }
            })
            Text(errorMsg)
                .foregroundColor(.red)
        }
    }
}

//struct PasswordFiledView_Previews: PreviewProvider {
//    static var previews: some View {
////        PasswordFiledView(textfiledvalue: .constant(""), isProtectedPass: .constant(false))
//    }
//}
