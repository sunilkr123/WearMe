//
//  NewArrivalsView.swift
//  WearMe
//
//  Created by macbook27 on 09/02/24.
//

import SwiftUI

struct NewArrivalsView: View {
    var iamges = ["newArrivals","newArrivals","newArrivals","newArrivals","newArrivals"]
    var body: some View {
        ZStack {
            Color("screen_bg")
                .ignoresSafeArea()
            VStack(spacing: 10) {
                HStack {
                    Text("New Arrivals")
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                    Spacer()
                    Button {
                        
                    } label: {
                        Text("See all")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                    }
                }
                .padding(.horizontal, 20)
                TabView {
                    ForEach(iamges, id: \.self) { imageName in
                        Image(imageName)
                        //.resizable()
                            .scaledToFit()
                           
                    }
                } //: Tabview
                .tabViewStyle(PageTabViewStyle())
                .frame(height: 120)
            }
      
        }
    }
}

struct NewArrivalsView_Previews: PreviewProvider {
    static var previews: some View {
        NewArrivalsView()
    }
}
