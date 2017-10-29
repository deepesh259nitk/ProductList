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
    fileprivate let identifier = "CellIdentifier"
    fileprivate var productsList = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        ProductDetailsDataManager.sharedObject.requestData()
        NotificationCenter.default.addObserver(self, selector:
            #selector(productListRefreshed(_:)), name: NSNotification.Name(rawValue:
                ProductService.ProductListRefreshedNotification), object: nil)
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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt
        indexPath: IndexPath) -> UICollectionViewCell {
        let dummyCell = UICollectionViewCell()
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                            for: indexPath) as? ProductCell else { return dummyCell }
        let product = self.productsList[indexPath.row]
        cell.productName.text = product.productName
        if let penny = product.price, let pounds = PriceUtilities.pounds(forPennies: penny),
            let formattedPrice = PriceUtilities.formatWithPoundSign(pounds) {
            cell.price.text = formattedPrice
        }
        if let imageUrl = self.productsList[indexPath.row].imageURL {
            cell.imageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "loading"))
        }
        cell.setFavouriteImage(self.productsList, index: indexPath.row)
        return cell
    }
    @objc func productListRefreshed(_ notification: Notification) {
        ProductDetailsDataManager.sharedObject.populateData()
        if let productList = ProductDetailsDataManager.sharedObject.cachedData() {
            self.productsList = productList
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
