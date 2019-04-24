//
//  SignUpTextField.swift
//  Onboarding
//
//  Created by Ethan John on 3/6/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class SignUpTextField: UITextField {

	override func awakeFromNib() {
		super.awakeFromNib()
		self.layer.borderColor = #colorLiteral(red: 0.5031271486, green: 0.4714708274, blue: 0.6456218274, alpha: 1)
		self.layer.borderWidth = 1
		self.layer.cornerRadius = 4
		if let placeholder = self.placeholder {
			self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.5031271486, green: 0.4714708274, blue: 0.6456218274, alpha: 1)])
		}
		let toolbar = UIToolbar()
		toolbar.sizeToFit()
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyBoard))
		let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		toolbar.setItems([flexibleSpace, doneButton], animated: true)
		self.inputAccessoryView = toolbar
		self.inputAccessoryView = toolbar
	}
	
	@objc func dismissKeyBoard() {
		self.resignFirstResponder()
	}
}
