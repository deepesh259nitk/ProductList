//
//  ProductCell.swift
//  ProductList
//
//  Created by ITRMG on 2017-24-07.
//  Copyright © 2016 Vasthimal, Deepesh : @djrecker. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var favButtonSelected: UIButton!
    @IBAction func favBtnTapped(_ sender: AnyObject) {
        if sender.tag == favButtonSelected.tag {
            if favButtonSelected.isHidden == true {
                FavouriteProducts.sharedInstance.addFavourite(sender.tag)
                favButton.isHidden = true
                favButtonSelected.isHidden = false
            } else {
                FavouriteProducts.sharedInstance.removeFavourite(sender.tag)
                favButton.isHidden = false
                favButtonSelected.isHidden = true
            }
        }
    }
    func setTagForFavourite(_ productId: Int) {
        favButton.tag = Int(productId)
        favButtonSelected.tag = Int(productId)
    }
    func setFavouriteImage(_ products: [Product], index: Int) {
        guard let productId = products[index].productId else { return }
        setTagForFavourite(productId)
        if FavouriteProducts.sharedInstance.products.count == 0 {
            return
        }
        if FavouriteProducts.sharedInstance.products.contains(favButton.tag) {
            favButton.isHidden = true
            favButtonSelected.isHidden = false
        } else {
            favButton.isHidden = false
            favButtonSelected.isHidden = true
        }
    }
}
