//
//  DayController.swift
//  DaysOfWeek
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class DayController {
    
    static var daysOfTheWeek: [Day] {
        let sunday = Day(name: "Sunday", description: "Added to the roman calendar by Emperor Constantine")
        let monday = Day(name: "Monday", description: "Added to the roman calendar by Emperor Constantine")
        let tuesday = Day(name: "Tuesday", description: "Tuesday comes from Tiu, or Tiw, the Anglo-Saxon name for Tyr, the Norse god of war. Tyr was one of the sons of Odin")
        let wednesday = Day(name: "Wednesday", description: "Odin -- also known as Woden, the supreme deity after whom Wednesday is named")
        let thursday = Day(name: "Thursday", description: "Thursday originates from Thor, the god of thunder.")
        let friday = Day(name: "Friday", description: "Friday is derived from Frigga, the wife of Odin, representing love and beauty.")
        let saturday = Day(name: "Saturday", description: "Saturday comes from Saturn, the ancient Roman god of fun and feasting.")
        return [sunday,monday,tuesday,wednesday,thursday,friday,saturday]
    }
    
}
