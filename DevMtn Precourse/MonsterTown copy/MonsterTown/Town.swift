//
//  Town.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

struct Town {
    var mayor = Mayor()
    let region: String
    var population: Int {
        didSet(oldPopulation) {
            if population < oldPopulation {
                print("The population has changed to \(population) from \(oldPopulation).")
                mayor.notify(oldPopulation, population)
            }
        }
    }
    var numberOfStoplights: Int
    
    init?(region: String, population: Int, stoplights: Int) {
        guard population > 0 else {
            return nil
        }
        self.region = region
        self.population = population
        numberOfStoplights = stoplights
    }
    init?(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
    enum Size {
        case small
        case medium
        case large
    }
    var townSize: Size {
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
                
            case 10_001...100_000:
                return Size.medium
                
            default:
                return Size.large
            }
        }
    }
    func printDescription() {
        if population > 0 {
            print("Population: \(population), number of stoplights: \(numberOfStoplights), region: \(region)")
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
