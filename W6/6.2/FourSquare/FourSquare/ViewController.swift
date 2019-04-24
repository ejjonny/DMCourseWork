//
//  ViewController.swift
//  FourSquare
//
//  Created by Ethan John on 3/5/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	let topLeft = UIButton()
	let topRight = UIButton()
	let bottomLeft = UIButton()
	let bottomRight = UIButton()
	var allButtons = [UIButton]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setUpTopLeft()
		setUpTopRight()
		setUpBottomLeft()
		setUpBottomRight()
		allButtons = [topLeft, topRight, bottomLeft, bottomRight]
	}
	
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	func setUpTopLeft() {
		view.addSubview(topLeft)
		topLeft.translatesAutoresizingMaskIntoConstraints = false
		topLeft.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
		topLeft.backgroundColor = .green
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: topLeft, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: topLeft, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: topLeft, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: topLeft, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
			])
	}
	
	func setUpTopRight() {
		view.addSubview(topRight)
		topRight.translatesAutoresizingMaskIntoConstraints = false
		topRight.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
		topRight.backgroundColor = .blue
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: topRight, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: topRight, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: topRight, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: topRight, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
			])

	}
	
	func setUpBottomLeft() {
		view.addSubview(bottomLeft)
		bottomLeft.translatesAutoresizingMaskIntoConstraints = false
		bottomLeft.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
		bottomLeft.backgroundColor = .red
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: bottomLeft, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: bottomLeft, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: bottomLeft, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: bottomLeft, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
			])
	}

	func setUpBottomRight() {
		view.addSubview(bottomRight)
		bottomRight.translatesAutoresizingMaskIntoConstraints = false
		bottomRight.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
		bottomRight.backgroundColor = .yellow
		NSLayoutConstraint.activate([
			NSLayoutConstraint(item: bottomRight, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: bottomRight, attribute: .trailing, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: bottomRight, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerX, multiplier: 1, constant: 0),
			NSLayoutConstraint(item: bottomRight, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .centerY, multiplier: 1, constant: 0)
			])
	}
	
	@objc func buttonTapped() {
		let topLeftColor = topLeft.backgroundColor
		let topRightColor = topRight.backgroundColor
		let bottomLeftColor = bottomLeft.backgroundColor
		let bottomRightColor = bottomRight.backgroundColor
		
		UIView.animate(withDuration: 3) {
			self.topRight.backgroundColor = topLeftColor
			self.bottomRight.backgroundColor = topRightColor
			self.bottomLeft.backgroundColor = bottomRightColor
			self.topLeft.backgroundColor = bottomLeftColor
		}
	}
	
	@objc func shakeItOff() {
		
	}
}

