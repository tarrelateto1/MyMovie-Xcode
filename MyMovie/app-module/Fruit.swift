//
//  Fruit.swift
//  MyMovie
//
//  Created by tar on 25/2/2563 BE.
//  Copyright © 2563 jirawat.com. All rights reserved.
//

import UIKit

struct Fruit {
    var name: String!
    var vitamin: String!
    
    init(attributes: [String: String]) {
        self.name = attributes["name"]
        self.vitamin = attributes["vitamin"]
    }
}
