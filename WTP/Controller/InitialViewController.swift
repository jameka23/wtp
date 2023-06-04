//
//  ViewController.swift
//  WTP
//
//  Created by Jameka Echols on 5/28/23.
//  Login Screen

import UIKit
import GoogleSignIn

class InitialViewController: UIViewController {
    
    private lazy var textFieldsStackViewContainer: UIStackView = {
       let sv = UIStackView(arrangedSubviews: [userNameTextField,passwordTextField])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 20
        sv.distribution = .fillEqually
        return sv
    }()
    
    private lazy var buttonsStackViewContainer:  UIStackView = {
        let sv = UIStackView(arrangedSubviews: [continueButton, googleButton])
         sv.translatesAutoresizingMaskIntoConstraints = false
         sv.axis = .vertical
         sv.spacing = 20
         sv.distribution = .fillEqually
         return sv
     }()
    
    var userNameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Username"
        tf.layer.cornerRadius = 20
        tf.borderStyle = .line
        tf.layer.borderColor = UIColor.systemGray4.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.masksToBounds = true
        return tf
    }()
    
    var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isSecureTextEntry = true
        tf.placeholder = "Password"
        tf.layer.cornerRadius = 20
        tf.borderStyle = .line
        tf.layer.borderColor = UIColor.systemGray4.cgColor
        tf.layer.borderWidth = 1.0
        tf.layer.masksToBounds = true // subviews will be clipped to the ROUNDED corners
        return tf
    }()
    
    var continueButton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var googleButton: UIButton = {
        let btn = UIButton()
         btn.translatesAutoresizingMaskIntoConstraints = false
         return btn
     }()
    
    var imageContainer: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    let signInConfig = GIDConfiguration(clientID: "359430597125-k1t3p60hhbl42ho4rt1cv84h6sc7nelj.apps.googleusercontent.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    func configureUI(){
        configureTextFields()
        configureContinueButton()
        configureGoogleButton()
        configureButtonStackView()
    }

    
    func configureTextFields(){
        view.addSubview(textFieldsStackViewContainer)
        textFieldsStackViewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textFieldsStackViewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textFieldsStackViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textFieldsStackViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        userNameTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userNameTextField.setLeftPaddingPoints(10)
        passwordTextField.setLeftPaddingPoints(10)
        
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        imageView.image = UIImage(systemName: "eye.slash")
        imageView.tintColor = .systemGray4
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        paddingView.addSubview(imageView)
        
        passwordTextField.rightView = paddingView
        passwordTextField.rightViewMode = .always
        
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        
    }
    
    func configureButtonStackView(){
        view.addSubview(buttonsStackViewContainer)
    
        buttonsStackViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        buttonsStackViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        buttonsStackViewContainer.topAnchor.constraint(equalTo: textFieldsStackViewContainer.bottomAnchor, constant: 20).isActive = true
        
        continueButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        googleButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func configureContinueButton(){
        var config = UIButton.Configuration.filled()
        config.title = "Continue"
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .systemGray6
        config.baseForegroundColor = .systemGray
        config.titlePadding = 5

        continueButton.configuration = config
        continueButton.addTarget(self, action: #selector(handleContinueButtonTap), for: .touchUpInside)
    }
    
    func configureGoogleButton(){
        var config = UIButton.Configuration.filled()
        config.title = "Sign In with Google"
        config.cornerStyle = .capsule
        config.image = UIImage(named: "btn_google_light_normal_ios")
        config.baseBackgroundColor = .white
//        config.layer?.borderColor
        config.baseForegroundColor = .black
        
        googleButton.configuration = config
        googleButton.addTarget(self, action: #selector(handleGoogleSignInTap), for: .touchUpInside)

    }

    @objc func handleContinueButtonTap(){
        let landingViewController = LandingViewController()
        navigationController?.pushViewController(landingViewController, animated: true)
    }
    
    @objc func handleGoogleSignInTap(){
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            let landingViewController = LandingViewController()
            self.navigationController?.pushViewController(landingViewController, animated: true)
        }
    }
    
}
extension InitialViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Check if there is any other text-field in the view whose tag is +1 greater than the current text-field on which the return key was pressed. If yes → then move the cursor to that next text-field. If No → Dismiss the keyboard
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return false
    }
}
    


