//
//  NameViewController.swift
//  ViewsAndStoryboards
//
//  Created by Ethan John on 1/20/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.backgroundColor = UIColor.gray
    }

}
