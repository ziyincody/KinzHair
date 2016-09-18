//
//  RegistrationPage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-23.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class RegistrationPage: UIViewController, UITextFieldDelegate {
    
    lazy var backButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("BACK", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    let fillInBelowLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Please fill in below"
        label.font = UIFont(name: "CenturyGothic", size: 30)
        return label
    }()
    
    let nameLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Name"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    lazy var nameTextField:CustomTextField = {
        let tf = CustomTextField()
        tf.delegate = self
        return tf
    }()
    
    let emailLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Email"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    lazy var emailTextField:CustomTextField = {
        let tf = CustomTextField()
        tf.delegate = self
        return tf
    }()

    let phoneNumberLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Phone Number"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    lazy var phoneNumberTextField:CustomTextField = {
        let tf = CustomTextField()
        tf.delegate = self
        return tf
    }()
    
    let passwordLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Password"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    lazy var passwordTextField:CustomTextField = {
        let tf = CustomTextField()
        tf.delegate = self
        return tf
    }()
    
    let passwordRetypeLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Password Retype"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    lazy var passwordRetypeTextField:CustomTextField = {
        let tf = CustomTextField()
        tf.delegate = self
        return tf
    }()
    
    lazy var registerButton:CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Sign In", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        return button
    }()
    
    func goBack() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func handleRegister() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        setupViewConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        nameTextField.setupBorder()
        emailTextField.setupBorder()
        phoneNumberTextField.setupBorder()
        passwordTextField.setupBorder()
        passwordRetypeTextField.setupBorder()
    }
    
    func setupViewConstraints() {
        
        view.addSubview(backButton)
        view.addSubview(fillInBelowLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(phoneNumberLabel)
        view.addSubview(phoneNumberTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(passwordRetypeLabel)
        view.addSubview(passwordRetypeTextField)
        view.addSubview(registerButton)
        
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        fillInBelowLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        fillInBelowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        fillInBelowLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        fillInBelowLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: fillInBelowLabel.bottomAnchor, constant: 6).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true

        emailLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 8).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 1).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        phoneNumberLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 8).isActive = true
        phoneNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneNumberLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        phoneNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 1).isActive = true
        phoneNumberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        phoneNumberTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordLabel.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 8).isActive = true
        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 1).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordRetypeLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 8).isActive = true
        passwordRetypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordRetypeLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordRetypeLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordRetypeTextField.topAnchor.constraint(equalTo: passwordRetypeLabel.bottomAnchor, constant: 1).isActive = true
        passwordRetypeTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordRetypeTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordRetypeTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        registerButton.topAnchor.constraint(equalTo: passwordRetypeTextField.bottomAnchor, constant: 12).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
