//
//  ExampleThing.swift
//  DelegatePractice
//
//  Created by Ethan John on 1/28/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Thing {
    var property1: String
    var property2: Int
    
    weak var delegate: ThingDelegate?
    
    init(prop1: String, prop2: Int) {
        self.property1 = prop1
        self.property2 = prop2
    }
}

protocol ThingDelegate: class{
    func updateMainThing()
}
