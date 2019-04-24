//
//  MyTimer.swift
//  PowerNap
//
//  Created by Ethan John on 1/28/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import Foundation

protocol MyTimerDelegate: class {
    func timerSecondTicked()
    func timerStopped()
    func timerCompleted()
}

class MyTimer {
    private var timer: Timer?
    
    weak var delegate: MyTimerDelegate?
    
    // Time left
    var timeLeft: TimeInterval?
    
    // Timer is on
    var isOn: Bool {
        if timeLeft == nil {
            return false
        } else {
            return true
        }
    }
    
    // func start / stop timer
    func startTimer(_ time: TimeInterval) {
        if isOn {
            // Nothing
            print("Already started")
        } else {
            timeLeft = time
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (_) in
                self.secondTicked()
            })
        }
    }
    
    // Stop timer
    func stopTimer() {
        self.timeLeft = nil
        timer?.invalidate()
        delegate?.timerStopped()
    }
    
    // Time left to string
    func timeLeftAsString() -> String {
        let timeRemaining = Int(self.timeLeft ?? 20 * 60)
        let minutesLeft = timeRemaining / 60
        let secondsLeft = timeRemaining - (minutesLeft * 60)
        return String(format: "%02d : %02d", arguments: [minutesLeft, secondsLeft])
    }
    
    // Called when a second passes
    private func secondTicked() {
        // Check time left
        guard let timeLeft = timeLeft else {
            return
        }

        // Reduce or stop timer
        if timeLeft > 0 {
            self.timeLeft = timeLeft - 1
            print(self.timeLeftAsString())
            delegate?.timerSecondTicked()
        } else {
            stopTimer()
            delegate?.timerCompleted()
        }
    }
}
