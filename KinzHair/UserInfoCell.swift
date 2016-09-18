//
//  UserInfoCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-04.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class UserInfoCell: BaseTableViewCell {

    let nameTitleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name:"
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "name"
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .left
        return label
    }()
    
    let emailTitleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email:"
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    let emailLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Email"
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .left
        return label
    }()
    
    let phoneNumberTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Phone #"
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    let phoneNumber:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "6478617868"
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .left
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(nameTitleLabel)
        addSubview(nameLabel)
        addSubview(emailTitleLabel)
        addSubview(emailLabel)
        addSubview(phoneNumberTitle)
        addSubview(phoneNumber)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v1(30)]-8-[v2(30)]-8-[v3(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v1":nameTitleLabel,"v2":emailTitleLabel,"v3":phoneNumberTitle]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(30)]-8-[v1(30)]-8-[v2(30)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":nameLabel,"v1":emailLabel,"v2":phoneNumber]))
        
        nameTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        emailTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        phoneNumberTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        phoneNumber.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
    }
}
