//
//  CountViewController.swift
//  DebugCountApp
//
//  Created by fumiyatanaka_admin on 2020/12/17.
//

import UIKit

class CountViewController: UIViewController {

    @IBOutlet var label: UILabel
    @IBOutlet var plusButton: UIButton!
    
    var number: String = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designPlusButton()
    }

    @IBAction func plus() {
        number += "1"
        label.text = String(number)
    }
    
    // Plusボタンを角丸にして枠線をつけるメソッド
    func designPlusButton() {
        plusButton.layer.cornerRadius = 8
        plusButton.layer.borderWidth = 2
        plusButton.layer.borderColor = plusButton.tintColor.cgColor
    }
}

