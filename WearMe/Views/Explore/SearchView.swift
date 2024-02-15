//
//  SearchView.swift
//  WearMe
//
//  Created by macbook27 on 09/02/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var serachText: String
    var filterAction: (() -> Void)?
    
    var body: some View {
        HStack {
            HStack {
                Button {
                    
                } label: {
                    Image("search")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                TextField("Looking for shoes", text: $serachText)
            }.frame(height: 40)
            .padding(5)
            .background(content: {
                Color.white
            })
            .cornerRadius(22.5)
            .shadow(color: .gray.opacity(0.6), radius: 10)
            Button {
                filterAction?()
            } label: {
                Image("filter")
                    
            }
        }
        .padding(.horizontal, 20)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(serachText: .constant("search"))
    }
}
