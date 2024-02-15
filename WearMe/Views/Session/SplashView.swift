//
//  SplashView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct SplashView: View {
    @State var isNavigateOnBOarding: Bool = false
    var body: some View {
        ZStack{
            Image("splash")
                .resizable()
                .ignoresSafeArea()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isNavigateOnBOarding = true
                    }
                }
        }
        .navigationDestination(isPresented:$isNavigateOnBOarding , destination: {
            OnBoardingView()
        })
        .navigationBarHidden(true)
     
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
