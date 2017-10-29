//
//  Product.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

let imageUrl = "https://cache.net-a-porter.com/images/products/%d/%d_fr_sl.jpg"
let productSummariesKey = "summaries"
let productNameKey = "name"
let productAmountKey = "amount"
let productPriceKey = "price"
let productIDKey = "id"
let prodctCurrencyKey = "currency"

enum Currency: String { // Add more currencies types here
    case GBP
}

struct Product {
    var productName: String
    var productId: Int?
    var price: Int64?
    var imageURL: String?
    var currencyType: String?
    var formattedPrice: String?
    init(json: [String: Any]) {
        self.productName = json[productNameKey] as? String ?? ""
        if let currencyJson = json[productPriceKey] as? JSONDict,
            let amount = currencyJson[productAmountKey] as? Int64,
            let currencyType =  currencyJson[prodctCurrencyKey] as? String,
            let productId = json[productIDKey] as? Int {
            self.price = amount
            self.currencyType = currencyType
            self.productId = productId
            self.imageURL = String(format: imageUrl, productId, productId)
            if let pounds = PriceUtilities.pounds(forPennies: amount),
                self.currencyType == String(describing: Currency.GBP) {  //Convert to Switch case in future to support multiple Currencies.
                self.formattedPrice = PriceUtilities.formatWithPoundSign(pounds)
            }
        }
    }
}
