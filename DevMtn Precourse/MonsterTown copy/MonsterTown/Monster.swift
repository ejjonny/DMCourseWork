//
//  Monster.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Monster {
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr"
    }
    var town: Town?
    var name: String
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    required init?(town: Town?, monsterName: String) {
        guard !monsterName.isEmpty else {
            return nil
        }
        self.town = town
        name = monsterName
    }
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet... :(")
        }
    }
}
