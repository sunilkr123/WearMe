//
//  HeaderView.swift
//  WearMe
//
//  Created by macbook27 on 07/02/24.
//

import SwiftUI

struct HeaderView: View {
    var action: (() -> Void)?
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            Button {
                action?()
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image("back")
            }
            Spacer()
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
