//
//  OffersViewController.swift
//  IbottaInterview
//
//  Created by Zach Vilardell on 11/5/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class OffersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var offersCollectionView: UICollectionView!
    let cellReuseID = "OffersCollectionViewCell"
    
    var offers: [Offer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Offers"
        
        //retrieve data for display
        getOfferData()
        
        //setup collection view
        setupSubviews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupSubviews() {
        offersCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        offersCollectionView.backgroundColor = UIColor.white
        offersCollectionView.register(OffersCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseID)
        offersCollectionView.delegate = self
        offersCollectionView.dataSource = self
        view.addSubview(offersCollectionView)
        setupConstraints()
    }
    
    func setupConstraints() {
        offersCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        let sideMarginSpacing: CGFloat = 12.0
        
        NSLayoutConstraint.activate([
            offersCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: sideMarginSpacing),
            offersCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -sideMarginSpacing),
            offersCollectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            offersCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
    
    func getOfferData() {
        //read in offers data from json file
        if let fileURL = Bundle.main.url(forResource: "Offers", withExtension: "json") {
            do {
                let rawData = try Data(contentsOf: fileURL)
                let jsonData = try JSONSerialization.jsonObject(with: rawData, options: []) as! [NSDictionary]
                
                //create an Offer object from each json item, map to data array
                offers = jsonData.map { dataDict in
                    return Offer(properties: dataDict)
                }
                
                for offer in offers {
                    print(offer.id)
                    print(offer.name)
                    print(offer.offerDescription)
                    print(offer.value)
                    print(offer.terms)
                    print(offer.imageURL)
                    print()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: UICollectionView DataSource/Delegate/DelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //prepare offer cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as! OffersCollectionViewCell
        cell.backgroundColor = UIColor.black
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //cellWidth is half the width of the collectionview minus half the collectionview's interitem spacing (8/2 = 4)
        let cellWidth = floor(collectionView.bounds.width / 2.0) - 4.0
        return CGSize(width: cellWidth, height: cellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        //minimum of 8 points spacing between row items in the collectionview
        return 8.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        //minimum of 24 points spacing between rows in the collectionview
        return 24.0
    }
}

