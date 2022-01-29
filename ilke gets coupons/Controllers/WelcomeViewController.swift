//
//  WelcomeViewController.swift
//  ilke gets coupons
//
//  Created by Güney Köse on 5.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = ""
        var charIndex = 0.0
        let titleText = "ilke wishes"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.textLabel.text?.append(letter)
                if titleText == "ilke wishes" {
                    performSegue(withIdentifier: "mainPage", sender: .none)
                }
            }
            charIndex += 1
    }
}
    
}
