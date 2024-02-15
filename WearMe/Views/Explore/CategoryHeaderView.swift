//
//  CategoryHeaderView.swift
//  WearMe
//
//  Created by macbook27 on 09/02/24.
//

import SwiftUI

struct CategoryHeaderView: View {
    var categories = ["All Shoes", "Outdoor", "Tennis", "Running"]
    @State var selectedItem: Int = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Select Category")
                .font(.system(size: 22))
                .fontWeight(.medium)
            ScrollView(.horizontal){
                LazyHGrid(rows: [ GridItem(.flexible()) ]) {
                    ForEach(categories.indices, id: \.self) { index in
                        Text(categories[index])
                            .foregroundColor(selectedItem == index ? Color.white :     Color.black)
                            .frame(width: 110, height: 40)
                            .background {
                                selectedItem == index ? Color("category_bg") :     Color.white
                            }
                            .cornerRadius(8)
                            .onTapGesture {
                                didSelect(index)
                            }
                    }
                }
            }
            .frame(height: 60)
        }
        .padding(.horizontal, 20)
        
    }
    
    func didSelect(_ index: Int) {
        selectedItem = index
        // Add your logic here for what should happen when a category is selected
    }
}

struct CategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHeaderView()
    }
}
