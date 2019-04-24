//
//  WelcomeViewController.swift
//  ViewsAndStoryboards
//
//  Created by Ethan John on 1/20/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome \(email)"

    }
}
