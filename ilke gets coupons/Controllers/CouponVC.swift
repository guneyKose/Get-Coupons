//
//  CouponVC.swift
//  ilke gets coupons
//
//  Created by Güney Köse on 23.12.2021.
//

import UIKit

class CouponVC: UIViewController {

    @IBOutlet weak var couponName: UILabel!
    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    let date = String(DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short))
    let coupon = K.coupons
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        couponName.text = K.coupons.randomElement()
        dateLabel.text = date
    
        switch couponName.text {
        case coupon[0]:
            couponImage.image = #imageLiteral(resourceName: "opel")
        case coupon[1]:
            couponImage.image = #imageLiteral(resourceName: "sarılma kuponu")
        case coupon[2]:
            couponImage.image = #imageLiteral(resourceName: "seks kuponu")
        case coupon[3]:
            couponImage.image = #imageLiteral(resourceName: "kahve")
        case coupon[4]:
            couponImage.image = #imageLiteral(resourceName: "yemek")
        case coupon[5]:
            couponImage.image = #imageLiteral(resourceName: "bira")
        case coupon[6]:
            couponImage.image = #imageLiteral(resourceName: "kivi")
        case coupon[7]:
            couponImage.image = #imageLiteral(resourceName: "kadıköy")
        case coupon[8]:
            couponImage.image = #imageLiteral(resourceName: "karşı")
        case coupon[9]:
            couponImage.image = #imageLiteral(resourceName: "sülo")
        case coupon[10]:
            couponImage.image = #imageLiteral(resourceName: "ödev")
        case coupon[11]:
            couponImage.image = #imageLiteral(resourceName: "motor")
        case coupon[12]:
            couponImage.image = #imageLiteral(resourceName: "çay")
        case coupon[13]:
            couponImage.image = #imageLiteral(resourceName: "metrobüs")
        case coupon[14]:
            couponImage.image = #imageLiteral(resourceName: "kedi")
        case coupon[15]:
            couponImage.image = #imageLiteral(resourceName: "IMG_3942")
            dateLabel.text = "bu kupon yaz aylarında kullanım için saklanabilir"
        default:
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let items = [couponImage.image!] as [Any]
        
        let avc = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        avc.excludedActivityTypes = [
            UIActivity.ActivityType.print,
            UIActivity.ActivityType.assignToContact,
            UIActivity.ActivityType.openInIBooks
        ]
        self.present(avc, animated: true, completion: nil)
    }
}
