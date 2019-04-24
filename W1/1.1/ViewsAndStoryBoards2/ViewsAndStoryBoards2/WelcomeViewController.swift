//
//  WelcomeViewController.swift
//  ViewsAndStoryBoards2
//
//  Created by Ethan John on 1/21/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    var email: String? = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let email = email else { return }
        
        if email.isEmpty{
            emailLabel.text = "Please enter a valid email address."
        } else {
            emailLabel.text = "Welcome, \(email)!"
        }
    }
}
