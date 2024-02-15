//
//  ExploreView.swift
//  WearMe
//
//  Created by macbook27 on 08/02/24.
//

import SwiftUI

struct ExploreView: View {
    @State var searchShoes: String = ""
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        ZStack(alignment: .leading){
            Color("screen_bg")
                .ignoresSafeArea()
            ScrollView {
                VStack(spacing: 25){
                    ExploreHeaderView {
                        //do your code for menu
                        presentSideMenu.toggle()
                    } cartAction: {
                        //do your code for cart button
                    }
                    
                    SearchView(serachText: $searchShoes) {
                        //do here code for the filter
                    }
                    CategoryHeaderView()
                    
                    PopularShoesView(items: ["", "", "", "","", ""], title: "Select Category") {
                        //do your code to see all
                    }
                    
                    PopularShoesView(items: ["", "", "", "","", ""], title: "Recommended for you") {
                        //do your code to see all
                    }
                    NewArrivalsView()
                    Spacer()
                }
            }
        }
        .navigationBarHidden(true)
        .onTapGesture {
            presentSideMenu.toggle()
        }
    }
   
    
}

//struct ExploreView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExploreView(, presentSideMenu: false)
//    }
//}
