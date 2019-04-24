//
//  SetBackgroundViewController.swift
//  ViewsAndStoryboards
//
//  Created by Ethan John on 1/20/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class SetBackgroundViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setBackgroundColorButtonTapped(_ sender: Any) {
        self.view.backgroundColor = UIColor.green
    }
    
}
