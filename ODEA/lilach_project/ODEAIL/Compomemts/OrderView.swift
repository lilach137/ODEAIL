//
//  RecentOrder.swift
//  ODEA
//
//  Created by Student19 on 17/07/2023.
//

import Combine
import SwiftUI

struct OrderView: View {

    let order: Order
    
    var body: some View {
        HStack(spacing: 20) {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Your order at:")
                Text("\(Date(timeIntervalSince1970: order.createdDate).formatted(date: .abbreviated, time: .shortened))")
            }
            Spacer()

                       Image(systemName: "list.clipboard")
                        
                           .onTapGesture {
                               
                           }
                   }
                   .padding(.horizontal)
                   .frame(maxWidth: .infinity, alignment: .leading)
               }
     
    }

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(order: Order(id: "111", createdDate: Date().timeIntervalSince1970, products: []))
    }
}
