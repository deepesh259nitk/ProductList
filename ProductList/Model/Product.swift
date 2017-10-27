//
//  Product.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

struct Product {
    
    var productName : String
    var pid : String
    var price : NSNumber
    var imageURL : String
    
    init(pname: String, pid: String, price : NSNumber, pimage : String){
        
        self.productName = pname
        self.pid = pid
        self.price = price
        self.imageURL = pimage
    }
}
