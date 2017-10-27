//
//  ViewController.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import UIKit
import SDWebImage

class ProductsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let identifier = "CellIdentifier"
    var productsList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        ProductDetailsDataManager.sharedObject.requestData()
        
        NotificationCenter.default.addObserver(self, selector: #selector(productListRefreshed(_:)), name: NSNotification.Name(rawValue: ProductService.ProductListRefreshedNotification), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension ProductsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.productsList.count
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! ProductCell
        
        let product = self.productsList[indexPath.row]
        
        let name = product.productName
        let price = product.price
        
        cell.productName.text = name
        
        if let price = NumberUtilities.formatPriceWithComma(price) {
            
            cell.price.text = "£ \(String(describing: price))"
            
        }
        
        let imageUrl = URL(string: self.productsList[indexPath.row].imageURL)
        cell.imageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "loading"))
        cell.setFavouriteImage(self.productsList, index: indexPath.row)
        
        return cell
    }
    
    @objc func productListRefreshed(_ notification : Notification){
        
        ProductDetailsDataManager.sharedObject.populateData()
        if let productList = ProductDetailsDataManager.sharedObject.cachedData(){
            self.productsList = productList
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

}

