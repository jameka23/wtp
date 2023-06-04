//
//  LoginViewController.swift
//  WTP
//
//  Created by Jameka Echols on 6/1/23.
//

import Foundation
import UIKit

class LandingViewController: UIViewController {
    
    var label: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabel()
        view.backgroundColor = .systemRed
//        configureBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    func configureBackButton(){
        let backButton = UIButton(type: .system) // Create a UIButton
        backButton.setTitle("Go Back", for: .normal) // Set the button title
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside) // Add target to the button

        backButton.frame = CGRect(x: self.view.frame.size.width / 2 - 50, y: self.view.frame.size.height / 2 - 25, width: 100, height: 50) // Set the frame for the button

        self.view.addSubview(backButton) // Add the button to the view
    }
    
    func configureLabel(){
        view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        label.text = "Welcome"
        label.textColor = .black
        label.textAlignment = .center
    }
    
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}

