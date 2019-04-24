//
//  PlanetController.swift
//  Solar System
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class PlanetController{
    
    init() {
        let mercury = Planet(planetName: "Mercury", millionKMsFromSun: 57.9, dayLength: 4222.6, diameter: 4879, imageName: "mercury", isInhabited: false)
        let venus = Planet(planetName: "Venus", millionKMsFromSun: 108.2, dayLength: 2802, diameter: 12104, imageName: "venus", isInhabited: false)
        let earth = Planet(planetName: "Earth", millionKMsFromSun: 148.6, dayLength: 24, diameter: 12756, imageName: "earth", isInhabited: true)
        let mars = Planet(planetName: "Mars", millionKMsFromSun: 227.9, dayLength: 24.7, diameter: 12756, imageName: "mars", isInhabited: false)
        let jupiter = Planet(planetName: "Jupiter", millionKMsFromSun: 778.6, dayLength: 9.9, diameter: 142984, imageName: "jupiter", isInhabited: false)
        let saturn = Planet(planetName:"Saturn", millionKMsFromSun: 1433.5, dayLength: 10.7, diameter: 51118, imageName: "saturn", isInhabited: false)
        let uranus = Planet(planetName: "Uranus", millionKMsFromSun: 2872.5, dayLength: 17.2, diameter: 49528, imageName: "uranus", isInhabited: false)
        let neptune = Planet(planetName: "Neptune", millionKMsFromSun: 4495.1, dayLength: 16.1, diameter: 49528, imageName: "neptune", isInhabited: false)
        let pluto = Planet(planetName: "Pluto", millionKMsFromSun: 5906.4, dayLength: 153.3, diameter: 2370, imageName: "pluto", isInhabited: false)
        self.planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]
        }
    
    // CRUD functions
    
    func create(planetWithName name: String, millionKMsFromSun: Float, dayLength: Float, diameter: Int, imageName: String, isInhabited: Bool) -> Planet {
        let planet = Planet(planetName: name, millionKMsFromSun: millionKMsFromSun, dayLength: dayLength, diameter: diameter, imageName: imageName, isInhabited: isInhabited)
        
        self.planets.append(planet)
        
        return planet
    }
    
    func delete(planet: Planet) {
        guard let index = self.planets.lastIndex(where: { $0 == planet }) else { return }
        self.planets.remove(at: index)
    }
    
    // Data persistence
    
    func savePlanetsToDisk() {
        // Save data to disk
    }
    
    func loadPlanetsFromDisk() {
        // Load planets from disk
    }
    
    var planets: [Planet]
}
