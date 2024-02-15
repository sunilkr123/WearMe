//
//  TitleView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct TitleView: View {
    var title: String = ""//"Hello Again!"
    var subtitle: String = ""//"Fill your details or continue with social media"
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Text(subtitle)
                .font(.title3)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.black.opacity(0.7))
         }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
