//
//  FavouriteView.swift
//  WearMe
//
//  Created by macbook27 on 09/02/24.
//

import SwiftUI

struct FavouriteView: View {
    let data = (1...30).map { "Item \($0)" }
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack {
            Color("screen_bg")
                .ignoresSafeArea()
            VStack {
                MenuHeaderView(action: {
                    presentSideMenu.toggle()
                }, title: "Favourite")
                    .padding(.horizontal, 20)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { item in
                            FavouriteItemView()
                                .frame(height: 250)
                        }
                    }
                    .padding(.horizontal, 10)
                }
            }
        }
    }
}

struct FavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteView(presentSideMenu: .constant(false))
    }
}

  
