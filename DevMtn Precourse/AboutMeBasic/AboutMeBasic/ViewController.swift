//
//  ViewController.swift
//  AboutMeBasic
//
//  Created by Ethan John on 12/5/18.
//  Copyright © 2018 ya boy E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        func setUpAboutMe(){
            nameLabel.text = "Ethan John"
            titleLabel.text = "Musician, student, artist, and also GOAT"
            ageLabel.text = "Age: 21"
            profileImageView.image = UIImage(named: "profileImage")
            bioLabel.text = "Bio: Without a doubt the absolute number one human being alive. Basically Mother Theresa incarnate. He is one of the most sought after influencers of today's generation with a widespread reach into the countless niche cultural subdivides. Word of mouth and iron biceps were the only thing he needed to become the modern icon of flourishing juvenile success. His teachings span the globe in a selfless wave of spiritual nourishment enlightening bros and nuns alike. The worldwide unification of nations is predicted to be headed up by the one and only Ethan John."
        }
        setUpAboutMe()
        
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        
}

