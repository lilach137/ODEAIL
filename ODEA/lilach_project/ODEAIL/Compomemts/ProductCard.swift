//
//  ProductView.swift
//  ODEA
//
//  Created by Student19 on 06/07/2023.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartViewModel: DataManager
    var product: Product
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .environment(\.layoutDirection, .rightToLeft)
                    
                    Text("\(product.price)$")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                
                
            }
            .frame(width: 180, height: 200)
            .shadow(radius: 3)
            
            
            Button {
                cartViewModel.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: productList[0])

    }
}
