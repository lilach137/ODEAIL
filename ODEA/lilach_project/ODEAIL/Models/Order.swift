//
//  NewOrder.swift
//  ODEA
//
//  Created by Student19 on 15/07/2023.
//

import Foundation

struct Order: Codable, Identifiable {
    let id: String
    let createdDate: TimeInterval
    var products: [Product]
    
    
    
}
