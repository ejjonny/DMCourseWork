//
//  PlanetDetailViewController.swift
//  Solar System
//
//  Created by Ethan John on 1/22/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class PlanetDetailViewController: UIViewController {

    @IBOutlet weak var diameterLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var dayLengthLabel: UILabel!
    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var inhabitedStatusLabel: UILabel!
    
    var planet: Planet?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }
    
    func updateViews() {
        if let planet = planet {
            diameterLabel.text = String(planet.diameter)
            distanceLabel.text = String(planet.millionKMsFromSun)
            dayLengthLabel.text = String(planet.dayLength)
            planetImageView.image = UIImage(named: planet.imageName)
            inhabitedStatusLabel.text = String(planet.isInhabited)
            self.title = planet.planetName
        }
    }
}
