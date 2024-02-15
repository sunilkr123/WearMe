//
//  ExploreHeaderView.swift
//  WearMe
//
//  Created by macbook27 on 09/02/24.
//

import SwiftUI

struct ExploreHeaderView: View {
    var menuAction: (() -> Void)?
    var cartAction: (() -> Void)?
    
    var body: some View {
        HStack {
            Button {
                menuAction?()
            } label: {
                Image("Hamburger")
            }
            Spacer()
            Image("explore_title")
            Spacer()
            Button {
                cartAction?()
            } label: {
                Image("cart")
            }
        }
        .padding(.horizontal, 20)
    }
}

struct ExploreHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreHeaderView()
    }
}
