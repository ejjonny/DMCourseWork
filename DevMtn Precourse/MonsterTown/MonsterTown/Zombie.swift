//
//  Zombie.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class  Zombie: Monster {
    var walksWithLimp = true
    
    final override func terrorizeTown() {
        
        if let existingPopulation = town?.population {
            if existingPopulation > 10 {
                town?.changePopulation(by: -10)
            } else {
                town?.setPopulation(to: 0)
            }
        }
        
        super.terrorizeTown()
    }
}
