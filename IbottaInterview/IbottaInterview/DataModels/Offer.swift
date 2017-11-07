//
//  Offer.swift
//  IbottaInterview
//
//  Created by Zach Vilardell on 11/7/17.
//  Copyright © 2017 zvilardell. All rights reserved.
//

import UIKit

class Offer: NSObject {
    
    var id: String = ""
    var name: String = ""
    var offerDescription: String = ""
    var terms: String = ""
    var value: String = ""
    var imageURL: String = ""
    var favorited: Bool = false
    
    init(properties: NSDictionary) {
        //build offer object from passed in property dictionary
        if let id = properties["id"] as? String {
            self.id = id
        }
        if let name = properties["name"] as? String {
            self.name = name
        }
        if let description = properties["description"] as? String {
            self.offerDescription = description
        }
        if let terms = properties["terms"] as? String {
            self.terms = terms
        }
        if let value = properties["current_value"] as? String {
            self.value = value
        }
        if let imageURL = properties["url"] as? String {
            self.imageURL = imageURL
        }
    }

}
