//
//  SignUpViewController.swift
//  JournalCloudKit
//
//  Created by Eric Lanza on 2/27/19.
//  Copyright © 2019 ETLanza. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserController.shared.fetchUser { (success) in
            if success {
                self.showHome()
            }
        }
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
        
        // Pull text out of each text field and assign them to two constants
        guard let email = emailTextField.text, !email.isEmpty,
            let username = usernameTextField.text, !username.isEmpty else { return }
        
        // Call the function we created earlier in the controller and pass in the two constants
        UserController.shared.saveUserWith(email: email, username: username) { (success) in
            if success {
                self.showHome()
            }
        }
    }
    
    func showHome() {
        DispatchQueue.main.async {
            // Getting our "Main.storyboard" and assining it to a constant
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            // Getting our "WelcomeViewController", instantiateing it, and assigning it to a constant
            let viewController = storyboard.instantiateViewController(withIdentifier: "homeNavCon")
            
            // Presenting the WelcomeViewController we just instantiated
            self.present(viewController, animated: true, completion: nil)
        }
    }
}
