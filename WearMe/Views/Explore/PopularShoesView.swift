//
//  PopularShoesView.swift
//  WearMe
//
//  Created by macbook27 on 09/02/24.
//

import SwiftUI

struct PopularShoesView: View {
    var items = ["d", "d","d", "d","d", "d"]
    var title: String = "Select Category"
    var seeAllAction: (() -> Void)?
    
    
    var body: some View {
    
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text(title)
                        .font(.system(size: 22))
                        .fontWeight(.medium)
                    Spacer()
                    Button {
                        seeAllAction?()
                    } label: {
                        Text("See all")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                    }
                }
                .padding(.horizontal, 20)
              
                ScrollView(.horizontal){
                    LazyHGrid(rows: [ GridItem(.flexible()) ], spacing: 20) {
                        ForEach(items.indices, id: \.self) { index in
                            VStack(alignment: .leading) {
                                Image("PngItem")
                                    .padding(.top, 10)
                                Text("Best Seller")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("deep_color"))
                                    .padding(.leading, 15)
                                    .padding(.vertical, 2)
                                
                                Text("Nike Jordan")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color("product_text"))
                                    .padding(.leading, 15)
                                    .padding(.vertical, 2)
                                
                                Text("$302.00")
                                    .font(.system(size: 18))
                                    .foregroundColor(Color.black)
                                    .padding(.leading, 15)
                                    .padding(.bottom, 15)
                            }
                            .frame(width: 180)
                            .background {
                                Color.white
                            }
                            .cornerRadius(25)
                            .overlay(alignment: .topLeading, content: {
                                Image(index%2 == 0 ? "heart" : "heart_red")
                                    .resizable()
                                    .frame(width: 22, height: 22)
                                    .padding(.top, 20)
                                    .padding(.leading, 10)
                            })
                            .overlay(alignment: .bottomTrailing, content: {
                                Button {
                                    
                                } label: {
                                    Text("+")
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 50, height: 50)
                                .background {
                                  Color("category_bg")
                                }
                                .cornerRadius(25, corners: .topLeft)
                                .cornerRadius(25, corners: .bottomRight)
                            })
                         
                        }
                    }
                }.frame(height: 230)
            }
       
        }
}

struct PopularShoesView_Previews: PreviewProvider {
    static var previews: some View {
        PopularShoesView()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
