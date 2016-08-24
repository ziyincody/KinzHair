//
//  SigninPage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-23.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class SigninPage: UIViewController {
    
    lazy var backButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("BACK", forState: .Normal)
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(goBack), forControlEvents: .TouchUpInside)
        return button
    }()
    
    let signinLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "SignIn"
        label.font = UIFont(name: "CenturyGothic", size: 35)
        return label
    }()
    
    let emailLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Email"
        label.font = UIFont(name: "CenturyGothic", size: 35)
        return label
    }()
    
    lazy var emailTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderColor = UIColor.whiteColor().CGColor
        tf.layer.borderWidth = 0.5
        tf.backgroundColor = UIColor.blackColor()
        return tf
    }()
    
    let passwordLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Password"
        label.font = UIFont(name: "CenturyGothic", size: 35)
        return label
    }()
    
    lazy var passwordTextField:UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderColor = UIColor.whiteColor().CGColor
        tf.layer.borderWidth = 0.5
        tf.backgroundColor = UIColor.blackColor()
        return tf
    }()
    
    lazy var signinButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("Sign In", forState: .Normal)
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(handleSignIn), forControlEvents: .TouchUpInside)
        return button
    }()
    
    func goBack() {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func handleSignIn() {
        
        self.presentViewController(TabBarConstroller(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        setupViewConstraints()
    }
    
    func setupViewConstraints() {
        
        view.addSubview(backButton)
        view.addSubview(signinLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(signinButton)
        
        backButton.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 12).active = true
        backButton.leftAnchor.constraintEqualToAnchor(view.leftAnchor, constant: 12).active = true
        backButton.widthAnchor.constraintEqualToConstant(100).active = true
        backButton.heightAnchor.constraintEqualToConstant(50).active = true
        
        signinLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 24).active = true
        signinLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        signinLabel.widthAnchor.constraintEqualToConstant(100).active = true
        signinLabel.heightAnchor.constraintEqualToConstant(100).active = true
        
        emailLabel.topAnchor.constraintEqualToAnchor(signinLabel.bottomAnchor, constant: 12).active = true
        emailLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        emailLabel.widthAnchor.constraintEqualToConstant(100).active = true
        emailLabel.heightAnchor.constraintEqualToConstant(100).active = true
        
        emailTextField.topAnchor.constraintEqualToAnchor(emailLabel.bottomAnchor, constant: 12).active = true
        emailTextField.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        emailTextField.widthAnchor.constraintEqualToConstant(100).active = true
        emailTextField.heightAnchor.constraintEqualToConstant(30).active = true
        
        passwordLabel.topAnchor.constraintEqualToAnchor(emailTextField.bottomAnchor, constant: 12).active = true
        passwordLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        passwordLabel.widthAnchor.constraintEqualToConstant(100).active = true
        passwordLabel.heightAnchor.constraintEqualToConstant(100).active = true
        
        passwordTextField.topAnchor.constraintEqualToAnchor(passwordLabel.bottomAnchor, constant: 12).active = true
        passwordTextField.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        passwordTextField.widthAnchor.constraintEqualToConstant(100).active = true
        passwordTextField.heightAnchor.constraintEqualToConstant(30).active = true
        
        signinButton.topAnchor.constraintEqualToAnchor(passwordTextField.bottomAnchor, constant: 12).active = true
        signinButton.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        signinButton.widthAnchor.constraintEqualToConstant(100).active = true
        signinButton.heightAnchor.constraintEqualToConstant(100).active = true
    }
}
