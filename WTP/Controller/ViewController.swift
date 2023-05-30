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
        userNameTextField.heightAnchor.constraint(equalToConstant: 54).isActive = true
        userNameTextField.backgroundColor = .white
        userNameTextField.textColor = .black
        userNameTextField.borderStyle = .bezel
        userNameTextField.placeholder = "Enter User Name"
        
    }

}

