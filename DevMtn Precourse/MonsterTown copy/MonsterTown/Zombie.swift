//
//  Zombie.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class  Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    
    init?(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    convenience init?(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Fred")
        if walksWithLimp {
            print("This zombie has a bad knee.")
        }
    }
    required convenience init?(town: Town?, monsterName: String) {
        self.init(limp: false, fallingApart: false, town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
    
    final override func terrorizeTown() {
        if !isFallingApart {
            
            if let existingPopulation = town?.population {
                if existingPopulation > 10 {
                    town?.changePopulation(by: -10)
                } else {
                    town?.setPopulation(to: 0)
                }
            }
        }
        
        super.terrorizeTown()
    }
}
