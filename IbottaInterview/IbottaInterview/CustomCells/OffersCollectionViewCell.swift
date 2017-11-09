//
//  OffersCollectionViewCell.swift
//  IbottaInterview
//
//  Created by Zach Vilardell on 11/7/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit
import SDWebImage

class OffersCollectionViewCell: UICollectionViewCell {
    
    //subviews
    var greyView: UIView!
    var productImageView: UIImageView!
    var valueLabel: UILabel!
    var nameLabel: UILabel!
    var favoritedImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //create and constrain cell's subviews
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(offer: Offer) {
        //configure cell elements from passed in offer
        nameLabel.text = offer.name
        valueLabel.text = offer.value
        favoritedImageView.isHidden = DataStore.sharedInstance.favoritedOfferIDs.contains(offer.id) ? false : true
        if let url = URL(string: offer.imageURL) {
            //load image asynchronously from url
        	productImageView.sd_setImage(with: url, completed: nil)
        } else {
            //no image
            productImageView.image = nil
        }
    }
    
    func setupSubviews() {
        //grey view
        greyView = UIView()
        greyView.backgroundColor = AppColors.lightGrey
        greyView.layer.cornerRadius = 5.0
        contentView.addSubview(greyView)
        
        //product image view
        productImageView = UIImageView()
        productImageView.contentMode = .scaleAspectFit
        greyView.addSubview(productImageView)
        
        //name label
        nameLabel = UILabel()
        nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 11.0)
        nameLabel.textColor = AppColors.textGrey
        contentView.addSubview(nameLabel)
        
        //value label
        valueLabel = UILabel()
        valueLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 12.0)
        valueLabel.textColor = AppColors.textGrey
        contentView.addSubview(valueLabel)
        
        //favorited image view
        favoritedImageView = UIImageView()
        favoritedImageView.contentMode = .scaleAspectFit
        favoritedImageView.tintColor = UIColor.green
        favoritedImageView.image = UIImage(named: "check")
        contentView.addSubview(favoritedImageView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
		greyView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        favoritedImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //grey view
            greyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            greyView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            greyView.topAnchor.constraint(equalTo: contentView.topAnchor),
            greyView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.75),
            //product image view
            productImageView.leadingAnchor.constraint(equalTo: greyView.leadingAnchor, constant: 6.0),
            productImageView.trailingAnchor.constraint(equalTo: greyView.trailingAnchor, constant: -6.0),
            productImageView.topAnchor.constraint(equalTo: greyView.topAnchor, constant: 6.0),
            productImageView.bottomAnchor.constraint(equalTo: greyView.bottomAnchor, constant: -6.0),
            //name label
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            //value label
            valueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            valueLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3.0),
            //favorited image view
            favoritedImageView.centerYAnchor.constraint(equalTo: valueLabel.centerYAnchor),
            favoritedImageView.heightAnchor.constraint(equalTo: valueLabel.heightAnchor),
            favoritedImageView.widthAnchor.constraint(equalTo: favoritedImageView.heightAnchor),
            favoritedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5.0)
        ])
    }
    
}
