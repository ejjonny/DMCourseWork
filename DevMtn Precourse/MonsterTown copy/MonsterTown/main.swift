//
//  main.swift
//  MonsterTown
//
//  Created by Ethan John on 1/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

var myTown = Town(population: 0, stoplights: 6)
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "")
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var convenientZombie = Zombie(town: myTown, monsterName: "Cock")
myTown?.printDescription()

print("Victim pool: \(String(describing: fredTheZombie?.victimPool))")
fredTheZombie?.victimPool = 500
print("Victim pool: \(String(describing: fredTheZombie?.victimPool))")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
fredTheZombie = nil
