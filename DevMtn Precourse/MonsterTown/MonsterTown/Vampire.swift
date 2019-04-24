//
//  Vampire.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Vampire: Monster {
    
    var totalVampires: [Vampire] = []
    
    func addVampire() {
        if totalVampires.isEmpty {
            totalVampires.append(self)
        }
        totalVampires.append(self)
    }
    
    override func terrorizeTown() {
        if let existingPopulation = town?.population {
            if existingPopulation > 1 {
                town?.changePopulation(by: -1)
                addVampire()
            } else {
                town?.setPopulation(to: 0)
            }
        }
    }
}
