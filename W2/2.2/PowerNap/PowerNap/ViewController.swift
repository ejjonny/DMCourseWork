//
//  ViewController.swift
//  PowerNap
//
//  Created by Ethan John on 1/28/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    

    // MARK: - Outlets
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    var myTimer = MyTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTimer.delegate = self
    }

    // MARK: - Actions
    @IBAction func napButtonTapped(_ sender: UIButton) {
        if myTimer.isOn {
            myTimer.stopTimer()
        } else {
            myTimer.startTimer(3)
            scheduleALocalAlert(timeInterval: 3)
        }
    }
    
    func updateViews() {
        timerLabel.text = myTimer.timeLeftAsString()
        if myTimer.isOn {
            title = "Stop"
        }
        timerButton.setTitle(title, for: .normal)
    }
    
    func createAlertController() {
        let alert = UIAlertController(title: "Time to wake up!", message: "Or is it?", preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "I'm up", style: .default, handler: nil)
        alert.addAction(dismissAction)
        let snoozeAction = UIAlertAction(title: "Snooze", style: .destructive) { (_) in
            let textField = alert.textFields?.first
            let timeAsString = textField?.text
            let timeAsDouble = Double(timeAsString!)!
            self.myTimer.startTimer(timeAsDouble * 60)
            self.scheduleALocalAlert(timeInterval: timeAsDouble * 60)
        }
        alert.addAction(snoozeAction)
        alert.addTextField { (textField) in
            textField.placeholder = "How many more minutes?"
            textField.keyboardType = .numberPad
        }
        present(alert, animated: true, completion: nil)
    }
    
    func scheduleALocalAlert(timeInterval: TimeInterval) {
        
        let content = UNMutableNotificationContent()
        content.subtitle = "Subtitle"
        content.body = "Body"
        content.badge = 10
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (_) in
            print("User asked to get a local notification")
        }
    }
}

// MARK: - MyTimerDelegate Methods

extension ViewController: MyTimerDelegate {
    
    func timerSecondTicked() {
        updateViews()
    }
    
    func timerStopped() {
        updateViews()
    }
    
    func timerCompleted() {
        updateViews()
        createAlertController()
    }
}
