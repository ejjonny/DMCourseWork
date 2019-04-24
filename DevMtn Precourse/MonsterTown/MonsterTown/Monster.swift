//
//  Monster.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Monster {
    var town: Town?
    var name = "Monster"
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet... :(")
        }
    }
}
