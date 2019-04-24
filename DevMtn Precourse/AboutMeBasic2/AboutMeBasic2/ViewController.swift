//
//  ViewController.swift
//  AboutMeBasic2
//
//  Created by Ethan John on 1/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var bioLabel: UILabel!
    
    func setUpAboutMe() {
        let ethan = Person(name: "Ethan", title: "Man of the Year", age: 21, profilePicture: UIImage(named: "profilePicture")!, bio: "Bio: Without a doubt the absolute number one human being alive. Basically Mother Theresa incarnate. He is one of the most sought after influencers of today's generation with a widespread reach into the countless niche cultural subdivides. Word of mouth and iron biceps were the only thing he needed to become the modern icon of flourishing juvenile success. His teachings span the globe in a selfless wave of spiritual nourishment enlightening bros and nuns alike. The worldwide unification of nations is predicted to be headed up by the one and only Ethan John.")
        nameLabel.text = ethan.name
        titleLabel.text = ethan.title
        ageLabel.text = String(ethan.age)
        profileImageView.image = ethan.profilePicture
        bioLabel.text = ethan.bio
        
    }
    
    override func viewDidLoad() {
        
        setUpAboutMe()
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}


