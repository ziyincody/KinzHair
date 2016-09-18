//
//  SigninPage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-23.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class SigninPage: UIViewController {
    
    var management = false
    
    lazy var backButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("BACK", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        return button
    }()
    
    let signinLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "SignIn"
        label.font = UIFont(name: "CenturyGothic", size: 30)
        return label
    }()
    
    let emailLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Email"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    lazy var emailTextField:CustomTextField = {
        let tf = CustomTextField()
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
        tf.placeholder = "password"
        return tf
    }()
    
    lazy var signinButton:CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Sign In", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    lazy var managementSigninButton:CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Management Sign In", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(handleManagementSignIn), for: .touchUpInside)
        return button
    }()
    
    func goBack() {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func handleSignIn() {
        self.present(ChooseSalonPage(), animated: true, completion: nil)
    }
    
    func handleManagementSignIn() {
        
        let layout = UICollectionViewFlowLayout()
        
        self.present(UINavigationController(rootViewController: ManagementPage(collectionViewLayout: layout)), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        setupViewConstraints()
        
        management = false
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        emailTextField.setupBorder()
        passwordTextField.setupBorder()
    }
    
    func setupViewConstraints() {
        
        view.addSubview(backButton)
        view.addSubview(signinLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signinButton)
        view.addSubview(managementSigninButton)
        
        backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        backButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signinLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        signinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signinLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: signinLabel.bottomAnchor, constant: 12).isActive = true
        emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 12).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 12).isActive = true
        passwordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        passwordLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 12).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 100).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        signinButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 12).isActive = true
        signinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signinButton.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        signinButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        managementSigninButton.topAnchor.constraint(equalTo: signinButton.bottomAnchor, constant: 12).isActive = true
        managementSigninButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        managementSigninButton.widthAnchor.constraint(equalTo:view.widthAnchor).isActive = true
        managementSigninButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}
