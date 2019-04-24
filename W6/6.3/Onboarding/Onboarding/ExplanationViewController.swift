//
//  ExplanationViewController.swift
//  Onboarding
//
//  Created by Ethan John on 3/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ExplanationViewController: UIViewController {

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.post(name: ParentViewController.pageSwipedNotification, object: nil, userInfo: [ParentViewController.pageIndexKey : 0])
	}
}
