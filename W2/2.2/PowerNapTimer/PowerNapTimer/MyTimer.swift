//
//  MyTimer.swift
//  PowerNapTimer
//
//  Created by Ethan John on 1/29/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

protocol TimerDelegate: class {
	func timerSecondTicked()
	func timerCompleted()
	func timerStopped()
}

class MyTimer {
	
	var timer: Timer?
	
	var timeRemaining: TimeInterval?
	
	var isOn: Bool {
		return timeRemaining == nil ? false : true
	}
	
	weak var delegate: TimerDelegate?
	
	// Seconds ticked
	func secondTicked() {
		guard let remaining = timeRemaining else { print("Time remaining is nil. Second not ticked"); return }
		if remaining > 0 {
			self.timeRemaining = remaining - 1
			delegate?.timerSecondTicked()
			print(self.timeRemaining!)
		} else {
			print("Timer finished")
			timer?.invalidate()
			self.timeRemaining = nil
			delegate?.timerCompleted()
		}
	}
	
	// Starts
	func startTimerWith(timeInterval: TimeInterval) {
		if !isOn {
			print("Start Timer called")
			self.timeRemaining = timeInterval
			self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
				self.secondTicked()
			})
		}
	}
	
	// Stops
	func stopTimer() {
		if isOn {
			print("Stop timer called")
			self.timeRemaining = nil
			self.timer?.invalidate()
		}
	}
	
	// Func that will return time remaining as a string
	func timeAsString() -> String {
		let timeRemaining = Int(self.timeRemaining ?? 20 * 60)
		let minutesRemaining = timeRemaining / 60
		let secondsRemaining = timeRemaining - (minutesRemaining * 60)
		return String(format: "%02d : %02d", arguments: [minutesRemaining, secondsRemaining])
	}
}
