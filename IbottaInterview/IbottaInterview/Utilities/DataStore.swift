//
//  DataStore.swift
//  IbottaInterview
//
//  Created by Zach Vilardell on 11/8/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    //array of all offers to display on offers page
    var offers: [Offer] = []
    //set of favorited offer id's
    var favoritedOfferIDs: Set<String> = []
    
    //---------------------------------------------------------------------------------------------------------------------------
    
    //singleton
    static let sharedInstance = DataStore()
    private override init() { //overriding init with private function to prevent usage of default public initializer for this class.
        super.init()
    }
    
    //---------------------------------------------------------------------------------------------------------------------------
    
    func loadOffers() {
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
}
