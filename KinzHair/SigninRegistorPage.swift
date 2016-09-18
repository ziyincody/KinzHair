//
//  ViewController.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-23.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class SigninRegistorPage: UIViewController {

    let appLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "KINZ"
        label.font = UIFont(name: "CenturyGothic", size: 35)
        return label
    }()
    
    let separatorLine:UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.blue
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var signinButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("Signin", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 25)
        button.addTarget(self, action: #selector(goToSigninPage), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("Register", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 25)
        button.addTarget(self, action: #selector(goToRegisterPage), for: .touchUpInside)

        return button
    }()
    
    func goToSigninPage() {
        
        self.present(SigninPage(), animated: true, completion: nil)
    }
    
    func goToRegisterPage() {
        
        self.present(RegistrationPage(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        setupViewConstraints()
    }
    
    func setupViewConstraints() {
        
        view.addSubview(appLabel)
        view.addSubview(separatorLine)
        view.addSubview(signinButton)
        view.addSubview(registerButton)

        appLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        appLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        appLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        appLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        separatorLine.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        separatorLine.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        separatorLine.widthAnchor.constraint(equalToConstant: 1).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        signinButton.rightAnchor.constraint(equalTo: separatorLine.leftAnchor, constant: -12).isActive = true
        signinButton.centerYAnchor.constraint(equalTo: separatorLine.centerYAnchor).isActive = true
        signinButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        signinButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        registerButton.leftAnchor.constraint(equalTo: separatorLine.rightAnchor, constant: 12).isActive = true
        registerButton.centerYAnchor.constraint(equalTo: separatorLine.centerYAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}

