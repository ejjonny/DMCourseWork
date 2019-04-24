//
//  SignUpViewController.swift
//  Onboarding
//
//  Created by Ethan John on 3/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
	
	@IBOutlet weak var emailField: UITextField!
	@IBOutlet weak var passField: UITextField!
	@IBOutlet weak var passConfirmField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		NotificationCenter.default.post(name: ParentViewController.pageSwipedNotification, object: nil, userInfo: [ParentViewController.pageIndexKey : 2])
		
//		NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
//			guard let userInfo = notification.userInfo,
//				let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
//
//		}
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
	}
}
