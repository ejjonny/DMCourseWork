//
//  BeanViewController.swift
//  ViewsAndStoryboards
//
//  Created by Ethan John on 1/20/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class BeanViewController: UIViewController {
    
    @IBOutlet weak var beanLabel: UILabel!
    
    var bean: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        beanLabel.text = "Nicely done \(bean)"
        
    }
}
