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
    var favoriteButton: UIControl!
    var favoriteLabel: UILabel!
    var favoriteImageView: UIImageView!

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
//        productImageView.layer.cornerRadius = 5.0
//        productImageView.backgroundColor = UIColor.fromHex(string: "#EEEEEE")
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
        
        //favorite button
        favoriteButton = UIControl()
        favoriteButton.layer.cornerRadius = 5.0
        favoriteButton.backgroundColor = offer.favorited ? UIColor.green : UIColor.fromHex(string: "#EEEEEE")
        favoriteLabel = UILabel()
        favoriteLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 18.0)
        favoriteLabel.textColor = offer.favorited ? UIColor.white : UIColor.fromHex(string: "#4A4A4A")
        favoriteLabel.text = offer.favorited ? "Favorited" : "Favorite This"
        favoriteButton.addSubview(favoriteLabel)
        favoriteImageView = UIImageView()
        favoriteImageView.contentMode = .scaleAspectFit
        favoriteImageView.image = UIImage(named: "check")
        favoriteImageView.tintColor = offer.favorited ? UIColor.white : UIColor.fromHex(string: "#4A4A4A")
        favoriteButton.addSubview(favoriteImageView)
        view.addSubview(favoriteButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        
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
            //favorite button
            favoriteButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            favoriteButton.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.66),
            favoriteButton.heightAnchor.constraint(equalToConstant: 60.0),
            favoriteButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -10.0),
            favoriteLabel.centerXAnchor.constraint(equalTo: favoriteButton.centerXAnchor, constant: -15.0),
            favoriteLabel.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor),
            favoriteImageView.centerYAnchor.constraint(equalTo: favoriteButton.centerYAnchor),
            favoriteImageView.leftAnchor.constraint(equalTo: favoriteLabel.rightAnchor, constant: 5.0),
            favoriteImageView.widthAnchor.constraint(equalToConstant: 30.0),
            favoriteImageView.heightAnchor.constraint(equalTo: favoriteImageView.widthAnchor)
        ])
    }

}
