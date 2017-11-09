//
//  DataStore.swift
//  IbottaInterview
//
//  Created by Zach Vilardell on 11/8/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit
import CoreData

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
    
    //retrieve favorited offer id's from disk via CoreData
    func loadFavoritedOfferIDs() {
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoritedOffer")
        do {
            if let favoritedOffers = try managedObjectContext.fetch(fetchRequest) as? [FavoritedOffer] {
                favoritedOfferIDs = Set<String>.init(favoritedOffers.map {$0.id!})
            }
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    //save favorited offer id to disk via CoreData
    func saveFavoritedOfferID(offerID: String) {
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "FavoritedOffer", in: managedObjectContext)!
        let favoritedOffer = NSManagedObject(entity: entity, insertInto: managedObjectContext)
        favoritedOffer.setValue(offerID, forKey: "id")
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    //delete favorited offer id from disk via CoreData
    func deleteFavoritedOfferID(offerID: String) {
        let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoritedOffer")
        fetchRequest.predicate = NSPredicate(format: "id==\(offerID)", argumentArray: nil)
        do {
            if let favoritedOffers = try? managedObjectContext.fetch(fetchRequest), let favoritedOffer = favoritedOffers.first {
                managedObjectContext.delete(favoritedOffer)
                try managedObjectContext.save()
            }
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
}
