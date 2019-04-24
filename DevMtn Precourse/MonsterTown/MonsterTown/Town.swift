//
//  Town.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

struct Town {
    var population = 5_422
    var numberOfStoplights = 4
    
    func printDescription() {
        if population > 0 {
            print("Population: \(population), number of stoplights: \(numberOfStoplights)")
        } else {
            print("Town is extinct")
        }
    }
    
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    mutating func setPopulation(to amount: Int) {
        population = amount
    }
}
