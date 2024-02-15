//
//  CartViewItem.swift
//  WearMe
//
//  Created by macbook27 on 12/02/24.
//

import SwiftUI

struct CartViewItem: View {
    var body: some View {
            HStack {
                Image("PngItem")
                    .resizable()
                    .frame(width: 110, height: 100)
                    .background(
                        Color("screen_bg")
                     )
                    .cornerRadius(15)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Nike Air Max 200")
                    Text("$94.05")
                }
                Spacer()
            }
    }
}

struct CartViewItem_Previews: PreviewProvider {
    static var previews: some View {
        CartViewItem()
    }
}
