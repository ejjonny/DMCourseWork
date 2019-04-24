//
//  ViewController.swift
//  DelegatePractice
//
//  Created by Ethan John on 1/28/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var updateThis = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        var thing = Thing(prop1: "Nice", prop2: 0)
        thing.delegate = self
    }
}

extension ViewController: ThingDelegate {
    func updateMainThing() {
        updateThis = 5
    }
}
