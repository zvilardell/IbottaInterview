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
    
    var greyView: UIView!
    var productImageView: UIImageView!
    var valueLabel: UILabel!
    var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupSubviews() {
        //grey view
        greyView = UIView()
        greyView.backgroundColor = UIColor.lightGray
        greyView.layer.cornerRadius = 5.0
        contentView.addSubview(greyView)
        
        //product image view
        productImageView = UIImageView()
        productImageView.backgroundColor = UIColor.cyan
        productImageView.contentMode = .scaleAspectFit
        greyView.addSubview(productImageView)
        
        //name label
        nameLabel = UILabel()
        nameLabel.backgroundColor = UIColor.magenta
        nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 11.0)
        nameLabel.text = "Product Name"
        contentView.addSubview(nameLabel)
        
        //value label
        valueLabel = UILabel()
        valueLabel.backgroundColor = UIColor.yellow
        valueLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 12.0)
        valueLabel.text = "Cash Back Value"
        contentView.addSubview(valueLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
		greyView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
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
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            //value label
            valueLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            valueLabel.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3.0)
        ])
    }
    
}
