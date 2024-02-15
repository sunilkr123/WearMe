//
//  MenuHeaderView.swift
//  WearMe
//
//  Created by macbook27 on 13/02/24.
//

import SwiftUI

struct MenuHeaderView: View {
    var action: (() -> Void)?
    var title: String = "title"
    var body: some View {
        HStack {
            Button {
                action?()
             } label: {
                Image("Hamburger")
//                     .resizable()
//                     .frame(width: 38, height: 30)
            }
            Spacer()
            Text(title)
                .font(.system(size: 22))
            Spacer()
            Image("")
                .resizable()
                .frame(width: 50, height: 50)
    }
}
}

struct MenuHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MenuHeaderView()
    }
}
