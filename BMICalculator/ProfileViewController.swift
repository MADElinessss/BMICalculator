//
//  ProfileViewController.swift
//  BMICalculator
//
//  Created by 신정연 on 1/4/24.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var nicknameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nickname = UserDefaults.standard.string(forKey: "nickname") {
            titleLabel.text = "\(nickname) 님의 프로필"
        } else {
            titleLabel.text = "고객 님의 프로필"
        }
//        titleLabel.text = UserDefaults.standard.string(forKey: "nickname")
        nicknameLabel.text = UserDefaults.standard.string(forKey: "nickname")
        weightLabel.text = "\(UserDefaults.standard.integer(forKey: "weight")) kg"
        heightLabel.text = "\(UserDefaults.standard.integer(forKey: "height")) m"
    }

}
