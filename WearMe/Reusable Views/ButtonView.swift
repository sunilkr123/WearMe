//
//  ButtonView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct ButtonView: View {
    var title: String = "Sign In"
    var action: (() -> Void)?
    var body: some View {
        GeometryReader { geometry in
               HStack {
                   Button(action: {
                       action?()
                   }, label: {
                       Text(title)
                           .foregroundColor(.white)
                           .font(.system(size: 18))
                           .frame(width: geometry.size.width, height: 45)
                           .background(Color("button_bg"))
                   })
               }
               .cornerRadius(15)
           }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
