//
//  DayDetailVC.swift
//  DaysOfWeek
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class DayDetailVC: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var dayReciever: Day?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = dayReciever?.name
        descriptionLabel.text = dayReciever?.description
    }
}
