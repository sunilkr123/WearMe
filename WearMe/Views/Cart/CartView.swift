//
//  CartView.swift
//  WearMe
//
//  Created by macbook27 on 12/02/24.
//

import SwiftUI

struct CartView: View {
    var cartItems = [1,2,3,4,5,6,7,8,9,0]
    @Binding var presentSideMenu: Bool
    var body: some View {
        ZStack {
            Color("screen_bg")
                .ignoresSafeArea()
            VStack {
                MenuHeaderView(action: {
                    presentSideMenu.toggle()
                }, title: "My Cart")
                .padding(.horizontal, 15)
                List {
                    ForEach(0...cartItems.count, id: \.self) { index in
                        HStack {
                            itemNoUpdateView
                            CartViewItem()
                        }
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .background(.clear)
                                .foregroundColor(.white)
                                .padding(
                                    EdgeInsets(
                                        top: 5,
                                        leading: 15,
                                        bottom: 5,
                                        trailing: 15
                                    )
                                )
                        )
                        .listRowSeparator(.hidden)
                    }
                    .onDelete { index in
                        
                    }
                    //                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    //                    Button(action: {
                    //                        //do your logic for left swipe
                    //                    }) {
                    //                        Text("Left Action")
                    //                    }
                    //                }
                    //
                    //                .swipeActions(edge: .trailing) {
                    //                    Button(action: {
                    //                        //do your logic for right swipe
                    //                    }) {
                    //                        Text("Right Action")
                    //                    }
                    //                }
                }
                .listStyle(.plain)
                .padding(.horizontal, 5)
            }
        }
}
    
    var itemNoUpdateView: some View {
        VStack(spacing: 10) {
                Text("+")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .onTapGesture {
                        print("cliked on + ")
                    }

             Text("1")
                .foregroundColor(.white)
            
            
                Text("-")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                    .onTapGesture {
                        print("cliked on - ")
                    }
         }
        .frame(width: 50)
        .background(
            Color("category_bg")
        )
        .cornerRadius(10)
    }
    
}


struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(presentSideMenu: .constant(false))
    }
}
