//
//  ViewController.swift
//  ProgrammaticConstraintsCalculator
//
//  Created by Ethan John on 3/4/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

//	let label: UILabel = {
//		let label = UILabel()
//		label.text = "Yo yo"
//		label.font = UIFont.boldSystemFont(ofSize: 14)
//		return label
//	}()
	
	var safeArea = UILayoutGuide()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .black
		safeArea = view.safeAreaLayoutGuide
		buttons()
	}
	
//	func constrainLabel() {
//		label.translatesAutoresizingMaskIntoConstraints = false
//		NSLayoutConstraint.activate([
//			NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 10),
//			NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1, constant: 10),
//			NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: self.view, attribute: .width, multiplier: 0.2, constant: 0)
//			])
//	}
	
	func buttons() {
		var lastStack: UIStackView? = nil
		var num = 1
		for _ in 0...2 {
			let stackView = UIStackView()
			stackView.alignment = .fill
			stackView.axis = .horizontal
			stackView.distribution = .equalSpacing
			stackView.translatesAutoresizingMaskIntoConstraints = false
			for _ in 0...2 {
				let button = UIButton(type: .system)
				button.backgroundColor = .orange
				button.tintColor = .white
				button.layer.cornerRadius = 30
				button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
				button.setTitle("\(num)", for: .normal)
				num += 1
				button.translatesAutoresizingMaskIntoConstraints = false
				stackView.addArrangedSubview(button)
				NSLayoutConstraint.activate([
					NSLayoutConstraint(item: button, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80),
					NSLayoutConstraint(item: button, attribute: .height, relatedBy: .equal, toItem: button, attribute: .width, multiplier: 1, constant: 0)
					])
			}
			self.view.addSubview(stackView)
			if lastStack == nil {
				NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: safeArea, attribute: .top, multiplier: 1, constant: safeArea.layoutFrame.height / 3).isActive = true
			} else if lastStack != nil {
				NSLayoutConstraint(item: stackView, attribute: .top, relatedBy: .equal, toItem: lastStack!, attribute: .bottom, multiplier: 1, constant: 30).isActive = true
			}
			NSLayoutConstraint.activate([
				NSLayoutConstraint(item: stackView, attribute: .width, relatedBy: .equal, toItem: safeArea, attribute: .width, multiplier: 1, constant: -50),
				NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: safeArea, attribute: .centerX, multiplier: 1, constant: 0),
				NSLayoutConstraint(item: stackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80)
				])
			lastStack = stackView
		}
		let zeroButton = UIButton()
		zeroButton.translatesAutoresizingMaskIntoConstraints = false
		zeroButton.backgroundColor = .gray
		zeroButton.layer.cornerRadius = 30
		zeroButton.setTitle("0", for: .normal)
		zeroButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
		self.view.addSubview(zeroButton)
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: zeroButton, attribute: .top, relatedBy: .equal, toItem: lastStack, attribute: .bottom, multiplier: 1, constant: 30),
			NSLayoutConstraint(item: zeroButton, attribute: .centerX, relatedBy: .equal, toItem: safeArea, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: zeroButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 80),
			NSLayoutConstraint(item: zeroButton, attribute: .height, relatedBy: .equal, toItem: zeroButton, attribute: .width, multiplier: 1, constant: 0)
			])
		
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(label)
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: 60)
		label.textAlignment = .center
		label.contentMode = .bottom
		label.text = "1900"
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: safeArea, attribute: .top, multiplier: 1, constant: safeArea.layoutFrame.height / 3 - 30),
			NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: lastStack, attribute: .width, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: label, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 100),
			NSLayoutConstraint(item: label, attribute: .centerX, relatedBy: .equal, toItem: safeArea, attribute: .centerX, multiplier: 1, constant: 0)
			])
	}
}

