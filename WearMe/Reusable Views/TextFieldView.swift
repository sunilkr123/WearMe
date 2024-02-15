//
//  TextFieldView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct TextFieldView: View {
   
    @Binding var textfiledvalue: String
    var title: String = ""
    var placeholder: String = ""
    var errorMsg: String = "Please enter emial id"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            TextField(placeholder, text: $textfiledvalue)
                .frame(width: .none, height: 50)
                .font(.system(size: 16, weight: .regular))
                .padding(.horizontal)
                .background {
                  Color("text_filed_bg")
              }
              .cornerRadius(20)
            Text(errorMsg)
                .foregroundColor(.red)
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView( textfiledvalue: .constant("new abc"))
    }
}
