//
//  NumberUtilities.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

class NumberUtilities {
    
    static func formatPriceWithComma(_ price: NSNumber)-> String? {
       return "£ \(price.formattedWithSeparator)"
    }
}

