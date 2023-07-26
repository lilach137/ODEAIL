//
//  Product.swift
//  ODEA
//
//  Created by Student19 on 06/07/2023.
//
import Foundation

struct Product: Codable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var price: Int
}
var productList = [Product(name: "Kisds Racket - 19", image: "racket19", price: 54),
                   Product(name: "Kisds Racket - 21", image: "racket21", price: 89),
                   Product(name: "Kisds Racket - 23", image: "racket23", price: 79),
                   Product(name: "Kisds Racket - 25", image: "racket25", price: 94),
                   Product(name: "OVERGRIP", image: "grips", price: 65),
                   Product(name: "Mini tennis 3/6", image: "miniTennis", price: 54),
                   Product(name: "Dryfit shirt", image: "proShirt", price: 22),
                   Product(name: "Clasic shirt", image: "classicShirt", price: 19),
                   Product(name: "Balls - Apple 3", image: "apple3", price: 33),
                   Product(name: "Balls - Orange 2", image: "ORAMGE2", price: 42),
                   Product(name: "BOMBER Rocket", image: "bomberRacket", price: 81),
                   Product(name: "Six Pack Shirt", image: "sizPackShirt", price: 44),
                   Product(name: "COMFORT bucket", image: "comportBucket", price: 34),
                   Product(name: "POWER bucket", image: "powerBucket", price: 28),
                   Product(name: "Balls - HONOR", image: "HONOR", price: 54),
                   Product(name: "Balls - PEAR 1", image: "PEAR1", price: 43)]
