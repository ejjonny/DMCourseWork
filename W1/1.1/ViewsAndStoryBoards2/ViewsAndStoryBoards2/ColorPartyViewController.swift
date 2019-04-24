//
//  ColorPartyViewController.swift
//  ViewsAndStoryBoards2
//
//  Created by Ethan John on 1/21/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ColorPartyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    // #Important
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toRedVC" {
            guard let destinationVC = segue.destination as? ColoredViewController else { return }
            destinationVC.pickedColor = UIColor.red
        }
        if segue.identifier == "toWhiteVC" {
            if let destinationVC = segue.destination as? ColoredViewController {
                destinationVC.pickedColor = UIColor.white
            }
        }
        if segue.identifier == "toPurpleVC" {
            if let destinationVC = segue.destination as? ColoredViewController {
                destinationVC.pickedColor = UIColor.purple
            }
        }
    }
    
    // MARK: Actions
    
    @IBAction func partyTouchUpInside(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.red
    }
    @IBAction func partyTouchUpOutside(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.yellow
    }
    @IBAction func partyTouchDragExit(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.green
    }
    @IBAction func partyTouchDown(_ sender: UIButton) {
        self.view.backgroundColor = UIColor.blue
    }
    
}
