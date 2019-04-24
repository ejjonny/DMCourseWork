//
//  SignupViewController.swift
//  ViewsAndStoryboards
//
//  Created by Ethan John on 1/20/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var beanField: UITextField!
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Check the segue's identifier
        if segue.identifier == "ToWelcomeVC" {
            // Get the object you want to send (email)
            if let email = emailField.text {
                // Get the new view controller using segue.destination.
                if let destinationViewController = segue.destination as? WelcomeViewController {
                    
                    // Pass the selected object (email) to the destination view controller.
                    destinationViewController.email = email
                    
                }
            }
        }
        if segue.identifier == "ToBeanVC" {
            if let bean = beanField.text {
                if let destinationViewController = segue.destination as? BeanViewController {
                    destinationViewController.bean = bean
                }
            }
        }
    }
}
