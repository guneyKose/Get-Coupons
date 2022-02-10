//
//  ViewController.swift
//  ilke gets coupons
//
//  Created by Güney Köse on 22.12.2021.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    var wishesCameTrue = 0
    var kiviAlpha = 0.85
    var charIndex = 0.0
    let titleText = K.appName
    let date = Double(Date().timeIntervalSince1970)
    
    @IBOutlet weak var wishTextField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var wishNumber: UILabel!
    @IBOutlet weak var couponButton: UIButton!
    @IBOutlet weak var couponError: UILabel!
    @IBOutlet weak var wishThatCameTrue: UILabel!
    @IBOutlet weak var wishThatCameTrue2: UILabel!
    @IBOutlet weak var wishThatCameTrue3: UILabel!
    @IBOutlet weak var guneyLabel: UILabel!
    @IBOutlet weak var ilkeWishes: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wishTextField.delegate = self
        responseLabel.text = ""
        wishNumber.text = ""
        couponError.alpha = 0
        wishThatCameTrue.text = ""
        wishThatCameTrue2.text = ""
        wishThatCameTrue3.text = ""
        guneyLabel.alpha = 0
        wishTextField.alpha = 0
        couponButton.alpha = 0
        
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.ilkeWishes.text?.append(letter)
            }
            charIndex += 1
            Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { time in
                self.updateUI()
            }
        }
    }
    @IBAction func couponButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: K.segue, sender: couponButton)
        getTheTime()
        notification()
        updateUI()
        }
    //MARK: - Notifications
    func notification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            //if didnt allowed granted
        }
        let content = UNMutableNotificationContent()
        content.title = "you have a message from guney!"
        content.body = "deneme🥝"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        center.add(request) { (error) in
            
        }
    }
    //MARK: - UpdateUI
    func updateUI() {
        if date - defaults.double(forKey: "time") >= 24*60*60*7  {
            guneyLabel.alpha = 1
            wishTextField.alpha = 1
            couponButton.alpha = 1
            ilkeWishes.alpha = 0
        } else {
            guneyLabel.alpha = 1
            wishTextField.alpha = 1
            ilkeWishes.alpha = 0
            couponButton.alpha = 0
            couponError.alpha = 1
        }
    }
    func getTheTime() {
        let time = Double(Date().timeIntervalSince1970)
        defaults.set(time, forKey: "time")
    }
}
//MARK: - UITextFieldDelegate

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wishTextField.endEditing(true)
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        wishNumber.text = "wishes came true : \(wishesCameTrue)"
        if wishTextField.hasText {
            responseLabel.text = K.responses.randomElement()
        }else{
            responseLabel.text = "type something!"
        }
        if wishesCameTrue + 1 <= 3 && responseLabel.text == K.positiveResponses[0] || responseLabel.text == K.positiveResponses[1]   {
            
            wishesCameTrue += 1
            let wish = wishTextField.text!
            wishNumber.text = "wishes came true : \(wishesCameTrue)"
            
            switch wishesCameTrue {
            case 1:
                wishThatCameTrue.text = wish
            case 2:
                wishThatCameTrue2.text = wish
            case 3:
                wishThatCameTrue3.text = wish
            default:
                wishThatCameTrue.text = ""
                wishThatCameTrue2.text = ""
                wishThatCameTrue3.text = ""
            }
        }
        if wishesCameTrue >= 3 {
            wishesCameTrue = 3
            responseLabel.text = K.wishLeft
        }
        if responseLabel.text == K.wishLeft {
            wishesCameTrue = 3
        }
        if responseLabel.text == "al sana bi kupon" {
            performSegue(withIdentifier: K.segue, sender: couponButton)
        }
        wishTextField.text = ""
    }
}





