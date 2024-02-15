//
//  WearMeApp.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI
import FacebookLogin

@main
struct WearMeApp: App {
    var body: some Scene {
            WindowGroup {
                NavigationStack {
                    SplashView()
                        .onAppear(){
                            ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
                        }
            }
        }
    }
}
