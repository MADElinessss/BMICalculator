//
//  ViewController.swift
//  BMICalculator
//
//  Created by 신정연 on 1/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var resultButton: UIButton!
    
    @IBOutlet var weightTestLabel: UILabel!
    @IBOutlet var heightTestLabel: UILabel!
    var bmi : String = ""
    var errorType : Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultButton.layer.cornerRadius = 10
        
        heightTestLabel.isHidden = false
        weightTestLabel.isHidden = true
    }
    
    @IBAction func onRandomButtonTapped(_ sender: UIButton) {
        let randomWeight : Int = Int.random(in: 35...90)
        weightTextField.text = "\(randomWeight)"
    }
    
    @IBAction func heightTextFieldChanged(_ sender: UITextField) {
        if let height = sender.text {
            // 키의 범위 검사
            if Int(height) ?? errorType <= 0 || Int(height) ?? errorType >= 1000{
                heightTestLabel.isHidden = false
                heightTestLabel.textColor = .red
                heightTestLabel.text = "올바른 키를 다시 입력해주세요."
                heightTextField.text = ""
            }
            else {
                heightTestLabel.isHidden = true
            }
        }
    }
    
    @IBAction func weightTextFieldChanged(_ sender: UITextField) {
        if let weight = sender.text {
            // 몸무게 범위 검사
            if Int(weight) ?? errorType <= 0 || Int(weight) ?? errorType >= 1000 {
                weightTestLabel.isHidden = false
                weightTestLabel.textColor = .red
                weightTestLabel.text = "올바른 몸무게를 다시 입력해주세요."
                weightTextField.text = ""
            }
            else {
                weightTestLabel.isHidden = true
            }
        }
    }
    
    @IBAction func onResultButtonTapped(_ sender: UIButton) {
        // 범위 검사 - nil이 아니라면,
        if let weight = weightTextField.text, let height = heightTextField.text {
            bmi = calculateBMI(weight: Int(weight) ?? errorType, height: Int(height) ?? errorType)
        }
        
        // MARK: Alert
        let alert = UIAlertController(title: "당신의 BMI 지수는", message: bmi, preferredStyle: .alert)
        let button = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(button)
        present(alert, animated: true)
    }
    
    @IBAction func keyboardDismiss(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func calculateBMI(weight: Int, height: Int) -> String {
        // BMI지수= 몸무게(kg) ÷ (신장(m) × 신장(m))
        let heightMeter : Double = Double(height) * 0.01
        let bmi : Double = Double(weight) / (heightMeter * heightMeter)
        
        if bmi == -10000 {
            return "잘못된 입력입니다."
        } else {
            return String(format: "%.2f", bmi)
        }
    }
}

