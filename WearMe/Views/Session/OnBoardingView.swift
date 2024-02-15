//
//  OnBoardingView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct OnBoardingView: View {
    @State var seletedIndex: Int = 0
    @State var isNagigateToLogin: Bool = false
    
    var images = ["Onboard-1", "Onboard-2", "Onboard-3"]
    var body: some View {
        ZStack {
            TabView(selection: $seletedIndex) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .tag(index)
                        .ignoresSafeArea()
                    
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .overlay(alignment: .bottom, content: {
                    Button {
                        if seletedIndex < images.count {
                            seletedIndex =  1+seletedIndex
                        }
                        isNagigateToLogin = seletedIndex == images.count
                        print(seletedIndex)
                    } label: {
                        Text(seletedIndex == 0 ? "Get Started" : "Next")
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.white)
                            .cornerRadius(13)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10)
                })
        }.navigationDestination(isPresented: $isNagigateToLogin, destination: {
            LoginView()
        })
        .background(
            LinearGradient(gradient: Gradient(colors: [Color("light_color"), Color("deep_color")]), startPoint: .top, endPoint: .bottom)
        )
        .navigationBarHidden(true)
        
        
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
