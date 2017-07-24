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
let imageUrl = "https://cache.net-a-porter.com/images/products/%@/%@_fr_sl.jpg"

let ProductSummariesKey = "summaries"
let ProductNameKey = "name"
let ProductAmountKey = "amount"
let ProductPriceKey = "price"
let ProductIDKey = "id"

class ProductService {
    
    static var json : JSONDict?
    static let ProductListRefreshedNotification = "ProductListRefreshed"
    static let UrlString = "https://api.net-a-porter.com/NAP/GB/en/60/0/summaries?categoryIds=2"
    
    var products = [Product]()
    
    func loadProducts(_ completion: ((AnyObject) -> Void)!) {
        
        let session = URLSession.shared
        if let productsUrl = URL(string: ProductService.UrlString){
            
            let task = session.dataTask(with: productsUrl, completionHandler: {
                (data, response, error) -> Void in
                
                do {
                    let JSON = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions(rawValue: 0))
                    guard let JSONDictionary: JSONDict = JSON as? JSONDict else {
                        print("Not a Dictionary")
                        return
                    }
                    
                    ProductService.json = JSONDictionary
                    NotificationCenter.default.post(name: Notification.Name(rawValue: ProductService.ProductListRefreshedNotification), object: nil)
                    
                }
                catch let JSONError as NSError {
                    print("\(JSONError)")
                }
                
            })
            
            task.resume()
        }
    }
    
    func debugSettings() -> NSDictionary?
    {
        if let dict = PathUtilities.findJSON(debugFileName)
        {
            return dict as NSDictionary
        }
        return nil
    }
    
    func parseData(_ jsonData : JSONDict)-> [Product]? {
        
        if let debugData = jsonData[ProductSummariesKey] as? NSArray {
            
            var image = ""
        
            for item in debugData {
                
                var eachItem = item as? JSONDict
                
                if let name = eachItem?[ProductNameKey] as? String, let id = eachItem?[ProductIDKey], let pid = id as? NSNumber, let price = eachItem?[ProductPriceKey], let amount = price[ProductAmountKey], let newAmount = amount {
                    
                    let pidStr = String(format:"%@", pid)
                    
                    if let amt = newAmount as? NSNumber{
                        
                        image = String(format: imageUrl, pidStr, pidStr )
                        let product = Product(pname: name, pid: pidStr, price: amt, pimage: image)
                        products.append(product)
                        
                    }
                    
                }
            }
            
        }
        
        return products
    }
}
