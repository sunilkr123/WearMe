//
//  FavouriteItemView.swift
//  WearMe
//
//  Created by macbook27 on 09/02/24.
//

import SwiftUI

struct FavouriteItemView: View {
    var colros = [Color.red, Color.blue]
    
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            Image("PngItem")
                .padding(.top, 10)
            Text("Best Seller")
                .multilineTextAlignment(.leading)
                .font(.system(size: 20))
                .foregroundColor(Color("deep_color"))
               
                
            Text("Nike Jordan")
                .multilineTextAlignment(.leading)
                .font(.system(size: 20))
                .foregroundColor(Color("product_text"))
                
            HStack {
                Text("$302.00")
                    .font(.system(size: 18))
                    .foregroundColor(Color.black)
                Spacer()
                ForEach(colros.indices, id: \.self) { index in
                     Circle()
                        .foregroundColor( colros[index])
                        .frame(width: 20, height: 15)
                }
            }              
        }
        .padding(15)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(alignment: .topLeading, content: {
            Image("heart_red")
                .resizable()
                .frame(width: 22, height: 22)
                .padding(.top, 20)
                .padding(.leading, 10)
        })
    }
}

struct FavouriteItemView_Previews: PreviewProvider {
    static var previews: some View {
        FavouriteItemView()
    }
}
