//
//  ViewController.swift
//  PowerNapTimer
//
//  Created by Ethan John on 1/29/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

	// MARK: - Outlets
	@IBOutlet weak var timeLabel: UILabel!
	@IBOutlet weak var startNapButton: UIButton!
	let myTimer = MyTimer()
	fileprivate let notificationIdentifier = "timerNotification"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		startNapButton.layer.cornerRadius = 10
		myTimer.delegate = self
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
//		resetTimer()
	}
	
	// MARK: - Actions
	@IBAction func napButtonTapped(_ sender: Any) {
		if myTimer.isOn{
			myTimer.stopTimer()
			cancelLocalNotification()
		} else {
			myTimer.startTimerWith(timeInterval: 5)
			scheduleLocalNotification()
		}
		updateViews()
	}
	
	func updateViews() {
		if myTimer.isOn {
			startNapButton.setTitle("Stop Nap", for: .normal)
		} else {
			startNapButton.setTitle("Start Nap", for: .normal)
		}
		updateLabel()
	}
	
	func updateLabel() {
		timeLabel.text = myTimer.timeAsString()
	}
	
	func setUpAlertController() {
		var snoozeTextField: UITextField?
		let alertController = UIAlertController(title: "Wake up!", message: nil, preferredStyle: .alert)
		alertController.addTextField { (textField) in
			textField.placeholder = "How much longer?"
			textField.keyboardType = .numberPad
			snoozeTextField = textField
		}
		let snoozeAction = UIAlertAction(title: "Snooze", style: .cancel) { (_) in
			guard let timeText = snoozeTextField?.text,
			let time = TimeInterval(timeText),
			!timeText.isEmpty else { return }
			self.myTimer.startTimerWith(timeInterval: time * 60)
			self.scheduleLocalNotification()
			self.updateViews()
		}
		let iAmUp = UIAlertAction(title: "I'm up", style: .destructive) { (_) in
			self.updateViews()
		}
		alertController.addAction(iAmUp)
		alertController.addAction(snoozeAction)
		present(alertController, animated: true, completion: nil)
	}
	
	func scheduleLocalNotification() {
		let notificationContent = UNMutableNotificationContent()
		notificationContent.sound = UNNotificationSound.default
		notificationContent.title = "Time to wake up!"
		notificationContent.body = "You are going to be late!"
		notificationContent.badge = 1
		
		guard let timeRemaining = myTimer.timeRemaining else { return }
		
		let dateComponents = Calendar.current.dateComponents([.minute, .second], from: Date(timeInterval: timeRemaining, since: Date()))
		
		let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
		
		let request = UNNotificationRequest(identifier: notificationIdentifier, content: notificationContent, trigger: trigger)
		
		UNUserNotificationCenter.current().add(request) { (error) in
			if let error = error {
				print(error.localizedDescription)
			}
		}
	}
	
	func cancelLocalNotification() {
		UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [notificationIdentifier])
	}
	
//	func resetTimer() {
//		UNUserNotificationCenter.current().getPendingNotificationRequests { (requests) in
//			let timerLocalNotification = requests.filter({ (request) -> Bool in
//				return request.identifier == self.notificationIdentifier
//			})
//
//			self.myTimer.stopTimer()
//
//			guard let timerNotificationRequest = timerLocalNotification.last,
//				let trigger = timerNotificationRequest.trigger as? UNCalendarNotificationTrigger,
//				let fireDate = trigger.nextTriggerDate() else { return }
//
//			self.myTimer.startTimerWith(timeInterval: fireDate.timeIntervalSinceNow)
//		}
//	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
}

// MARK: - Timer Delegate

extension ViewController: TimerDelegate {
	
	func timerSecondTicked() {
		updateLabel()
	}
	
	func timerCompleted() {
		updateViews()
		setUpAlertController()
	}
	
	func timerStopped() {
		updateViews()
	}
}
