//
//  ColoredViewController.swift
//  ViewsAndStoryBoards2
//
//  Created by Ethan John on 1/21/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ColoredViewController: UIViewController {
    
    // Landing Pad
    var pickedColor = UIColor()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = pickedColor
    }
}
