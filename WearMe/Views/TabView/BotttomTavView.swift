//
//  BotttomTavView.swift
//  WearMe
//
//  Created by macbook27 on 12/02/24.
//

import SwiftUI

struct BotttomTavView: View {
    @State var selectedIndex: Int = 0
    @State var presentSideMenu = false
    
    init() {
           UITabBar.appearance().backgroundColor = UIColor.white
       }
    
    var body: some View {
        ZStack {
            
            TabView(selection: $selectedIndex) {
                ExploreView(presentSideMenu: $presentSideMenu)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                
                FavouriteView(presentSideMenu: $presentSideMenu)
                    .tabItem {
                        Label("Favourite", systemImage: "heart")
                    }
                
                CartView(presentSideMenu: $presentSideMenu)
                    .tabItem {
                        Label("cart", image: "bottom_cart")
                    }
                
                ProfileView(presentSideMenu: $presentSideMenu)
                    .tabItem {
                        Label("Profile", image: "profile_bottom")
                    }
                
            }
            
            SideMenu(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedIndex, presentSideMenu: $presentSideMenu)))
        }
    }
}

struct BotttomTavView_Previews: PreviewProvider {
    static var previews: some View {
        BotttomTavView()
    }
}
