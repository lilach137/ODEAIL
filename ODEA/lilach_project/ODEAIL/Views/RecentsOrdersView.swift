//
//  RecentsOrdersView.swift
//  ODEA
//
//  Created by Student19 on 15/07/2023.
//

import FirebaseFirestoreSwift
import SwiftUI


struct RecentsOrdersView: View {
    @EnvironmentObject var viewModel: DataManager
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
       }
    
    var sortedOrders: [Order] {
            return viewModel.recentsOrders.sorted(by: { $0.createdDate > $1.createdDate })
        }
    
    var body: some View {
        if viewModel.recentsOrders.count > 0 {
            NavigationView{
                VStack {
                    List(sortedOrders) { order in
                        OrderView(order: order)
                    }
                    .listStyle(PlainListStyle())
                }
                .navigationTitle("Recents orders")
            }
        } else {
            Text("You don't have orders yet")
        }
    }
}

struct RecentsOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        RecentsOrdersView(userId: "1234")
    }
}
