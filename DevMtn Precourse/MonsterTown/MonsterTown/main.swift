//
//  main.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

let fredTheZombie = Zombie()

var myTown = Town()

fredTheZombie.town = myTown

fredTheZombie.town?.setPopulation(to: 300)
fredTheZombie.town?.printDescription()
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

myTown.printDescription()

let gualbertoTheVampire = Vampire()
gualbertoTheVampire.town = myTown
gualbertoTheVampire.town?.printDescription()
gualbertoTheVampire.terrorizeTown()
gualbertoTheVampire.town?.printDescription()
print(gualbertoTheVampire.totalVampires.count)
gualbertoTheVampire.terrorizeTown()
gualbertoTheVampire.town?.printDescription()
print(gualbertoTheVampire.totalVampires.count)
