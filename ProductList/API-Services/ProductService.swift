//
//  ProductService.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import Foundation

//clothing API url
// http://api.net-a-porter.com/NAP/GB/en/60/0/summaries?categoryIds=2

let debugFileName = "categories"

class ProductService {
    static var json: JSONDict?
    static let ProductListRefreshedNotification = "ProductListRefreshed"
    static let UrlString = "https://api.net-a-porter.com/NAP/GB/en/60/0/summaries?categoryIds=2"
    var products = [Product]()
    func loadProducts(_ completion: ((AnyObject) -> Void)!) {
        let session = URLSession.shared
        guard let productsUrl = URL(string: ProductService.UrlString) else { return }
        let task = session.dataTask(with: productsUrl,
                                        completionHandler: { (data, _, _)
                                            -> Void in do {
                                                guard let data = data else { return }
                                                let JSON = try JSONSerialization.jsonObject(with:
                                                    data, options: JSONSerialization.ReadingOptions(rawValue: 0))
                                                guard let JSONDictionary: JSONDict = JSON as? JSONDict else {
                                                    print("Not a Dictionary")
                                                    return
                                                }
                                                ProductService.json = JSONDictionary
                                                NotificationCenter.default.post(name:
                                                    Notification.Name(rawValue:
                                                        ProductService.ProductListRefreshedNotification), object: nil)
                                            } catch let JSONError as NSError {
                                                print("\(JSONError)")
                                            }
            })
            task.resume()
    }
    func debugSettings() -> NSDictionary? {
        if let dict = PathUtilities.findJSON(debugFileName) {
            return dict as NSDictionary
        }
        return nil
    }
    func parseProductsData(_ jsonData: JSONDict) -> [Product]? {
        if let debugData = jsonData[productSummariesKey] as? NSArray {
            for item in debugData {
                guard let productJsonDict = item as? JSONDict else { return [Product]() }
                    let product = Product(json: productJsonDict)
                    products.append(product)
                }
            }
        return products
    }
}
