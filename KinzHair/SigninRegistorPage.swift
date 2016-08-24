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
        line.backgroundColor = UIColor.blueColor()
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    lazy var signinButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("Signin", forState: .Normal)
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 35)
        button.addTarget(self, action: #selector(goToSigninPage), forControlEvents: .TouchUpInside)
        return button
    }()
    
    lazy var registerButton:CustomButton = {
        let button = CustomButton()
        button.setTitle("Register", forState: .Normal)
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 35)
        button.addTarget(self, action: #selector(goToRegisterPage), forControlEvents: .TouchUpInside)

        return button
    }()
    
    func goToSigninPage() {
        
        self.presentViewController(SigninPage(), animated: true, completion: nil)
    }
    
    func goToRegisterPage() {
        
        self.presentViewController(RegistrationPage(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        setupViewConstraints()
    }
    
    func setupViewConstraints() {
        
        view.addSubview(appLabel)
        view.addSubview(separatorLine)
        view.addSubview(signinButton)
        view.addSubview(registerButton)

        appLabel.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 12).active = true
        appLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        appLabel.widthAnchor.constraintEqualToConstant(100).active = true
        appLabel.heightAnchor.constraintEqualToConstant(100).active = true
        
        separatorLine.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor).active = true
        separatorLine.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor).active = true
        separatorLine.widthAnchor.constraintEqualToConstant(1).active = true
        separatorLine.heightAnchor.constraintEqualToConstant(150).active = true
        
        signinButton.rightAnchor.constraintEqualToAnchor(separatorLine.leftAnchor, constant: -12).active = true
        signinButton.centerYAnchor.constraintEqualToAnchor(separatorLine.centerYAnchor).active = true
        signinButton.widthAnchor.constraintEqualToConstant(100).active = true
        signinButton.heightAnchor.constraintEqualToConstant(100).active = true
        
        registerButton.leftAnchor.constraintEqualToAnchor(separatorLine.rightAnchor, constant: 12).active = true
        registerButton.centerYAnchor.constraintEqualToAnchor(separatorLine.centerYAnchor).active = true
        registerButton.widthAnchor.constraintEqualToConstant(100).active = true
        registerButton.heightAnchor.constraintEqualToConstant(100).active = true
    }

}

