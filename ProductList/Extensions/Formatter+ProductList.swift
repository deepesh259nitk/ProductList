//
//  Formatter+ProductList.swift
//  ProductList
//
//  Created by ITRMG on 2017-27-10.
//  Copyright © 2017 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}
