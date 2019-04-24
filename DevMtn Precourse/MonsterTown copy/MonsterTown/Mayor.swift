//
//  Mayor.swift
//  MonsterTown
//
//  Created by Ethan John on 1/13/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Mayor {
    private var anxietyLevel: Int = 0
    
    func notify(_ oldPopulation: Int,_  population: Int) {
        if population < oldPopulation {
            anxietyLevel += 10
            print("I'm deeply saddened to hear about this latest tragedy. I promise that my office is looking into the nature of this rash of violence.")
        }
    }
}
