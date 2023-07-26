//
//  ShopView.swift
//  ODEA
//
//  Created by Student19 on 15/07/2023.
//

import SwiftUI

struct ShopView: View {
    @StateObject var mainViewModel = MainViewModel()
    @EnvironmentObject var dataManager: DataManager
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }

    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    

    
    var body: some View {
       
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id) { product in
                        ProductCard(product: product)
                            .environmentObject(dataManager)
                    }
                }
                .padding()
            }
            .navigationTitle(Text("ODEA Shop"))
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        mainViewModel.signOut()
                    }) {
                        Text("Logout")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: CartView(userId: userId).environmentObject(dataManager)) {
                        CartButton(numberOfProducts: dataManager.products.count)
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct contentView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView(userId: "1234")
    }
}
