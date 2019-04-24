//
//  FlashlightViewController.swift
//  Flashlight
//
//  Created by Ethan John on 1/21/19.
//  Copyright © 2019 ya boy E. All rights reserved.
//

import UIKit
import AVFoundation

class FlashlightViewController: UIViewController {
    
    @IBOutlet weak var flashlightToggleButton: UIButton!
    
    func toggleTorch(on: Bool) {
        guard let device = AVCaptureDevice.default(for: .video) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }
    
    var isOn = false
    var statusBarStyle: UIStatusBarStyle = .lightContent
    
    // Updates status bar style
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return statusBarStyle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // Listens for button taps
    @IBAction func flashlightToggleButtonTapped(_ sender: Any) {
        toggleSoftwareLightStatus()
    }
    
    // Listens for swipes
    @IBAction func swipeGestureRecognizer(_ sender: Any) {
        toggleSoftwareLightStatus()
    }
    
    // Switches overall status of application (on/off)
    func toggleSoftwareLightStatus() {
        switch isOn {
        case false:
            self.view.backgroundColor = UIColor.white
            flashlightToggleButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
            flashlightToggleButton.setTitle("Turn Off", for: UIControl.State.normal)
            statusBarStyle = .default
            toggleTorch(on: !isOn)
            isOn = !isOn
            print("Flashlight on: \(isOn)")
            setNeedsStatusBarAppearanceUpdate()
        case true:
            self.view.backgroundColor = UIColor.black
            flashlightToggleButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            flashlightToggleButton.setTitle("Turn On", for: UIControl.State.normal)
            statusBarStyle = .lightContent
            toggleTorch(on: !isOn)
            isOn = !isOn
            print("Flashlight on: \(isOn)")
            setNeedsStatusBarAppearanceUpdate()
        }
    }
}
