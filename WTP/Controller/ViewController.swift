//
//  ViewController.swift
//  WTP
//
//  Created by Jameka Echols on 5/28/23.
//  Login Screen

import UIKit

class ViewController: UIViewController {
    
    var userNameTextField: UITextField = {
       let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
       let textAttribute =  NSAttributedString(string: "My Placeholder",
                                                            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        tf.attributedPlaceholder = textAttribute
        return tf
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .cyan
        configureUI()
    }
    
    func configureUI(){
       configureTextField()
    }
    
    func configureTextField(){
        
        view.addSubview(userNameTextField)
        userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        userNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30).isActive = true
        userNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        userNameTextField.delegate = self
        
        userNameTextField.backgroundColor = .white
        userNameTextField.textColor = .black
        userNameTextField.placeholder = "Username"
        userNameTextField.borderStyle = .line
        userNameTextField.layer.cornerRadius = 28
        
        userNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 60))
        userNameTextField.leftViewMode = .always
    }

}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Check if there is any other text-field in the view whose tag is +1 greater than the current text-field on which the return key was pressed. If yes → then move the cursor to that next text-field. If No → Dismiss the keyboard
        //    if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
        //        nextField.becomeFirstResponder()
        //    } else {
        //        textField.resignFirstResponder()
        //    }
        //        return false
        //    }
        view.endEditing(true)
        return true
        
    }
}

