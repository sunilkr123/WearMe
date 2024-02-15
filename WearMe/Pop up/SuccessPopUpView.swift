//
//  SuccessPopUpView.swift
//  WearMe
//
//  Created by macbook27 on 08/02/24.
//

import SwiftUI

struct SuccessPopUpView: View {
    var body: some View {
        VStack(spacing: 10) {
            Image("email_envalope")
                .resizable()
                .frame(width: 60, height: 60)
                .padding(.vertical, 10)
            Text("Check your email")
                .font(.system(size: 22))
                .fontWeight(.medium)
            Text("We have send password recovery code in your email")
                .font(.system(size: 18))
                .fontWeight(.regular)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(20)
    }
}

struct SuccessPopUpView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessPopUpView()
    }
}
