//
//  Item.swift
//  ToDooey
//
//  Created by Khalid Shakur on 10/8/16.
//  Copyright © 2016 khalidshakur. All rights reserved.
//

import UIKit

class Item{
    
    // MARK: Properties
    var name: String
    var timestamp: Double
    var completed: Bool
    
    init?(name: String) {
        self.completed = false
        self.name = name
        self.timestamp = NSDate().timeIntervalSince1970
        if name.isEmpty {
            return nil
        }
    }

}
