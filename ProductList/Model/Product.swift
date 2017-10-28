//
//  Product.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

let imageUrl = "https://cache.net-a-porter.com/images/products/%@/%@_fr_sl.jpg"
let productSummariesKey = "summaries"
let productNameKey = "name"
let productAmountKey = "amount"
let productPriceKey = "price"
let productIDKey = "id"

struct Product {
    var productName: String
    var pid: String
    var price: NSNumber = 0
    var imageURL: String
    init(json: [String: Any]) {
        self.productName = json[productNameKey] as? String ?? ""
        self.pid = String(format: "%@", json[productIDKey] as? NSNumber ?? -1)
        if let amountKey = json[productPriceKey] as? JSONDict, let amount = amountKey[productAmountKey] as? NSNumber {
            self.price = amount
        }
        self.imageURL = String(format: imageUrl, pid, pid )
    }
}
