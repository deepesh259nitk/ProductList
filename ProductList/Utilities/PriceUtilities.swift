//
//  PriceUtilities.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

class PriceUtilities {
    static func formatWithPoundSign(_ price: String) -> String? {
        return "£ \(price)"
    }
    static func pounds(forPennies: Int64) -> String? {
        return String(format: "%.2f", Double(forPennies)/100)
    }
}
