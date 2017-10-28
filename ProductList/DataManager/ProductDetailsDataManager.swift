//
//  ProductDetailsDataManager.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

class ProductDetailsDataManager {
    private var debugFileName = "categories"
    static let sharedObject = ProductDetailsDataManager()
    var productCache: [Product]?
    func requestData() {
        let api = ProductService()
        api.loadProducts(nil)
//        if ProductService.json != nil {
//            self.populateData()
//        }
    }
    func populateData() {
        let api = ProductService()
        if AppConstants.isSTUBBED {
            if let stubbedData = self.debugSettings() {
                self.productCache = api.parseProductsData(stubbedData)
            }
        } else {
            if let jsonData = ProductService.json {
                self.productCache = api.parseProductsData(jsonData)
            }
        }
    }
    func cachedData() -> [Product]? {
        if let productCache = productCache {
            return productCache
        }
        return nil
    }
    func debugSettings() -> JSONDict? {
        if let dict = PathUtilities.findJSON(debugFileName) {
            return dict
        }
        return nil
    }
}
