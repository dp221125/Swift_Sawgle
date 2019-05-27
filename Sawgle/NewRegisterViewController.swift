//
//  NewRegisterViewController.swift
//  Sawgle
//
//  Created by Edward Ahn on 5/20/19.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class NewRegisterViewController: UIViewController {

    @IBOutlet var idCheckCircle: UIImageView!
    @IBOutlet var passwordCheckCircle: UIImageView!
    @IBOutlet var passwordMatchCheckCIrcle: UIImageView!
    @IBOutlet var nameCheckCircle: UIImageView!
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var matchPasswordTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var birthDayLabel: UILabel!
    @IBOutlet var idCheckLabel: UILabel!
    @IBOutlet var passwordCheckLabel: UILabel!
    @IBOutlet var matchPasswordLabel: UILabel!
    @IBOutlet var registerButton: UIButton!
    
    func makeLabelFontSize() {
        
        if let targetView = view.viewWithTag(999) {
            let height = targetView.bounds.height
            let birthDayFont = UIFont(name: "S-CoreDream-4Regular", size: height * 0.2)
            birthDayLabel.font = birthDayFont
        }
        
        if let targetView = view.viewWithTag(998) {
            let height = targetView.bounds.height
            let checkLabelFont =  UIFont(name: "S-CoreDream-4Regular", size: height * 0.7)
            idCheckLabel.font = checkLabelFont
            idCheckLabel.adjustsFontSizeToFitWidth = true
            passwordCheckLabel.font = checkLabelFont
            matchPasswordLabel.font = checkLabelFont
        }
        
        
    }
    
    @objc func textFieldDidChange(_ sender: UITextField) {

        if let inputText = sender.text {
            if inputText.isHangul() {
                idCheckLabel.text = "사용할 수 없는 문자열이 포함되어 있습니다."
                idCheckCircle.backgroundColor = .red
            }else{
                let removeSpace = inputText.trimmingCharacters(in: .whitespaces)
                
                if removeSpace != "" {
                    idCheckLabel.text = "사용할 수 있는 아이디 입니다."
                    idCheckCircle.backgroundColor = .green
                }else{
                    idCheckLabel.text = ""
                    idCheckCircle.backgroundColor = nil
                }
            }
        }
    }
    
    @IBAction func goBackView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func moveBirthDayView(_ sender: Any) {
        
        guard let birthVC = self.storyboard?.instantiateViewController(withIdentifier: "birthDayVC") else {
            return
        }
        
        birthVC.modalPresentationStyle = .overCurrentContext
        self.present(birthVC,animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        
        let height = idCheckCircle.bounds.height
        idCheckCircle.layer.cornerRadius = height * 0.5
        passwordCheckCircle.layer.cornerRadius = height * 0.5
        passwordMatchCheckCIrcle.layer.cornerRadius = height * 0.5
        nameCheckCircle.layer.cornerRadius = height * 0.5
        makeLabelFontSize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idTextField.delegate = self
        passwordTextField.delegate = self
        matchPasswordTextField.delegate = self
        nameTextField.delegate = self
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        
    }
}
extension NewRegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
extension String {
    
    func isHangul() -> Bool {
        
        let regex = try? NSRegularExpression(pattern: "^[a-zA-Z0-9]*$")
        let results = regex?.matches(in: self,
                                    range: NSRange(self.startIndex..., in: self))
        
        if results?.count == 0 {
            return true
        }
        
        return false
    }
}

