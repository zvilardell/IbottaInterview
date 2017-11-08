//
//  OfferDetailsViewController.swift
//  IbottaInterview
//
//  Created by Zach Vilardell on 11/8/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class OfferDetailsViewController: UIViewController {
    
    //the offer we're viewing, set from OffersViewController when offer is selected
    var offer: Offer!
    
    //subviews
    var productImageView: UIImageView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var valueLabel: UILabel!
    var termsTextView: UITextView!
    var favoriteButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Details"
        setupSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSubviews() {
        //image view
        productImageView = UIImageView()
        productImageView.backgroundColor = UIColor.cyan
        productImageView.contentMode = .scaleAspectFit
        if let url = URL(string: offer.imageURL) {
        	productImageView.sd_setImage(with: url, completed: nil)
        } else {
            productImageView.image = nil
        }
        view.addSubview(productImageView)
        
        //value label
        valueLabel = UILabel()
        valueLabel.backgroundColor = UIColor.magenta
        valueLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 18.0)
        valueLabel.textColor = UIColor.fromHex(string: "#4A4A4A")
        valueLabel.text = offer.value
        view.addSubview(valueLabel)
        
        //name label
        nameLabel = UILabel()
        nameLabel.backgroundColor = UIColor.magenta
        nameLabel.numberOfLines = 2
        nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        nameLabel.textColor = UIColor.fromHex(string: "#4A4A4A")
        nameLabel.text = offer.name + "hello hello hello hello"
        view.addSubview(nameLabel)
        
        //description label
        descriptionLabel = UILabel()
        descriptionLabel.backgroundColor = UIColor.magenta
        descriptionLabel.numberOfLines = 2
        descriptionLabel.font = UIFont(name: "AvenirNext-Regular", size: 16.0)
        descriptionLabel.textColor = UIColor.fromHex(string: "#4A4A4A")
        descriptionLabel.text = offer.offerDescription + "hello hello hello hello"
        view.addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //image view
            productImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10.0),
            productImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -10.0),
            productImageView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10.0),
            productImageView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, multiplier: 0.3),
            //value label
            valueLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            valueLabel.widthAnchor.constraint(equalTo: productImageView.widthAnchor),
            valueLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 10.0),
            //name label
            nameLabel.leftAnchor.constraint(equalTo: valueLabel.leftAnchor),
            nameLabel.rightAnchor.constraint(equalTo: valueLabel.rightAnchor),
            nameLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 3.0),
            //description label
            descriptionLabel.leftAnchor.constraint(equalTo: valueLabel.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: valueLabel.rightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3.0),
        ])
    }

}
