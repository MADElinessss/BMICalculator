//
//  MainViewController.swift
//  BMICalculator
//
//  Created by 신정연 on 1/4/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var nextButton: UIButton!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var profileButton: UIButton!
    @IBOutlet var nicknameTestLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nicknameTestLabel.isHidden = true
        nextButton.layer.cornerRadius = 10
        profileButton.layer.cornerRadius = 10
    }
    
    @IBAction func nicknameChanged(_ sender: UITextField) {
        if sender.text != "" && sender.text?.count ?? 0 >= 2 {
            UserDefaults.standard.set(sender.text, forKey: "nickname")
            nicknameTestLabel.isHidden = true
            nextButton.isEnabled = true
        } else if sender.text?.count ?? 0 < 2 {
            nicknameTestLabel.isHidden = false
            nicknameTestLabel.text = "두 글자 이상 입력해주세요."
            nextButton.isEnabled = false
        } else {
            nicknameTestLabel.isHidden = false
            nicknameTestLabel.text = "잘못된 입력입니다."
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
