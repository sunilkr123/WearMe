//
//  DemoDeisgn.swift
//  WearMe
//
//  Created by macbook27 on 14/02/24.
//

import SwiftUI

struct TermsAndConditionsView: View {
    @State private var isPrivacyPolicyAccepted = false
    @State private var isTermsAccepted = false

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 0) {
                    CheckBoxView(isChecked: $isPrivacyPolicyAccepted)
                    .padding(.trailing, 5)
                    Text("I accept the ")
                        .foregroundColor(.black)
                
                    Text("privacy policy")
                        .underline()
                        .foregroundColor(.blue)
                        .onTapGesture {
//                            isPrivacyPolicyAccepted.toggle()
                        }
                    Text(" and ")
                        .foregroundColor(.black)
                
                Text("terms")
                   .lineLimit(1)
                    .underline()
                    .foregroundColor(.blue)
                    .onTapGesture {
//                        isTermsAccepted.toggle()
                        //same redirection of "of use" will be used
                    }
                }
            HStack(spacing: 0)  {
                Text("of use")
                   .lineLimit(1)
                    .underline()
                    .foregroundColor(.blue)
                    .onTapGesture {
//                        isTermsAccepted.toggle()
                    }
            Text(" of the AICare platform")
                .foregroundColor(.black)
            }
            .padding(.leading, 22)
        }
//      .padding()
    }
}


struct TermsAndConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndConditionsView()
    }
}



struct CheckBoxView: View {
    @Binding var isChecked: Bool
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(isChecked ? .blue : .black)
        }
    }
}
