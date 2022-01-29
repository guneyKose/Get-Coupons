//
//  ViewController.swift
//  ilke gets coupons
//
//  Created by Güney Köse on 22.12.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var wishTextField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var wishNumber: UILabel!
    @IBOutlet weak var couponButton: UIButton!
    @IBOutlet weak var kivi: UIImageView!
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
        kivi.alpha = kiviAlpha
        couponError.alpha = 0
        wishThatCameTrue.text = ""
        wishThatCameTrue2.text = ""
        wishThatCameTrue3.text = ""
        guneyLabel.alpha = 0
        wishTextField.alpha = 0
        kivi.alpha = 0
        couponButton.alpha = 0
        
        var charIndex = 0.0
        let titleText = Responses.appName
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
    
    func updateUI() {
        guneyLabel.alpha = 1
        wishTextField.alpha = 1
        kivi.alpha = 1
        couponButton.alpha = 1
        ilkeWishes.alpha = 0
    }
    
    var wishesCameTrue = 0
    var kiviAlpha = 0.85

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wishTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        wishNumber.text = "wishes came true : \(wishesCameTrue)"
        
        if wishTextField.hasText {
            responseLabel.text = Responses.responses.randomElement()
            
        }else{
            responseLabel.text = "type something!"
        }
        
        if wishesCameTrue + 1 <= 3 && responseLabel.text == Responses.positiveResponses[0] || responseLabel.text == Responses.positiveResponses[1]   {
            
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
            responseLabel.text = "no wishes left. but you can take a coupon."
        }
        if responseLabel.text == "no wishes left. but you can take a coupon." {
            wishesCameTrue = 3
        }
        if responseLabel.text == "al sana bi kupon" {
            performSegue(withIdentifier: Responses.segue, sender: couponButton)
        }
        wishTextField.text = ""
    }
    @IBAction func couponButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: Responses.segue, sender: couponButton)
        couponButton.alpha = 0
        couponError.alpha = 1
    }
}




