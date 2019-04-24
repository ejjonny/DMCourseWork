//
//  PlanetModel.swift
//  Solar System
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

class Planet {
    var planetName: String
    var millionKMsFromSun: Float
    var dayLength: Float
    var diameter: Int
    var imageName: String
    var isInhabited: Bool
    
    init(planetName: String, millionKMsFromSun: Float, dayLength: Float, diameter: Int, imageName: String, isInhabited: Bool) {
        self.planetName = planetName
        self.millionKMsFromSun = millionKMsFromSun
        self.dayLength = dayLength
        self.diameter = diameter
        self.imageName = imageName
        self.isInhabited = isInhabited
    }
}

extension Planet: Equatable {}

func == (lhs: Planet, rhs: Planet) -> Bool {
    if lhs.planetName != rhs.planetName { return false }
    if lhs.millionKMsFromSun != rhs.millionKMsFromSun { return false }
    if lhs.dayLength != rhs.dayLength { return false }
    if lhs.diameter != rhs.diameter { return false }
    if lhs.imageName != rhs.imageName { return false }
    if lhs.isInhabited != rhs.isInhabited { return false }
    
    return true
}
