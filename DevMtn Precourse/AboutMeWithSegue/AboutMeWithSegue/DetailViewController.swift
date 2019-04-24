//
//  DetailViewController.swift
//  AboutMeWithSegue
//
//  Created by Ethan John on 1/7/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    
    var person: Person? {
        didSet {
            
            loadViewIfNeeded()
            
            updateView()
            
        }
    }
    
    func updateView() {
        nameLabel.text = person?.name
        titleLabel.text = person?.title
        ageLabel.text = "Age: \(String(describing: person?.age))"
        profileImageView.image = person?.profilePicture
        bioLabel.text = person?.bio
    }

        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
