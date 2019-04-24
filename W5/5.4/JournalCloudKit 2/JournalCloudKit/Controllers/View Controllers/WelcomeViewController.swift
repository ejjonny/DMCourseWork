//
//  WelcomeViewController.swift
//  JournalCloudKit
//
//  Created by Eric Lanza on 2/27/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews() {
        guard let user = UserController.shared.loggedInUser else { return }
        welcomeLabel.text = "Welcome, \(user.username)"
    }
}
