//
//  Person.swift
//  AboutMeWithSegue
//
//  Created by Ethan John on 1/7/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation
import UIKit

class Person {
    var name: String
    var title: String
    var age: Int
    var profilePicture: UIImage
    var bio: String
    
    init(name: String, title: String, age: Int, profilePicture: UIImage, bio: String) {
        self.name = name
        self.title = title
        self.age = age
        self.profilePicture = profilePicture
        self.bio = bio
    }
}
