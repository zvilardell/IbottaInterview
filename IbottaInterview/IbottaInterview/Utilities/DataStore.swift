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
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    //MARK: CoreData manipulation
    
    //retrieve favorited offer id's from disk via CoreData
    func loadFavoritedOfferIDs() {
        let managedObjectContext = persistentContainer.viewContext
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
        let managedObjectContext = persistentContainer.viewContext
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
        let managedObjectContext = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "FavoritedOffer")
        fetchRequest.predicate = NSPredicate(format: "id==\(offerID)", argumentArray: nil)
        do {
            let favoritedOffers = try managedObjectContext.fetch(fetchRequest)
            if let favoritedOffer = favoritedOffers.first {
                managedObjectContext.delete(favoritedOffer)
                try managedObjectContext.save()
            }
        } catch let error as NSError {
            print(error.debugDescription)
        }
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentContainer(name: "IbottaInterview")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
