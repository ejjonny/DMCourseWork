//
//  SignUpViewController.swift
//  ViewsAndStoryBoards2
//
//  Created by Ethan John on 1/21/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWelcomeVC" {
            if let destinationVC = segue.destination as? WelcomeViewController {
                destinationVC.email = emailField.text
            }
        }
    }
}
