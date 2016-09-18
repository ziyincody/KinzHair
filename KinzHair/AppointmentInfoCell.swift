//
//  AppointmentInfoCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-04.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class AppointmentInfoCell: BaseTableViewCell {
    
    let dayAndTimeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 18)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.text = "Date and time"
        return label
    }()
    
    let appointmentTitleLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 18)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.text = "Appointment Title"
        return label
    }()
    
    lazy var editButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Century Gothic", size: 18)
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.setTitle("Edit", for: UIControlState())
        return button
    }()
    
    lazy var deleteButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: "Century Gothic", size: 18)
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.black, for: UIControlState())
        button.setTitle("Edit", for: UIControlState())
        return button
    }()
    
    let separatorLine:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    override func setupViews() {
        
        addSubview(dayAndTimeLabel)
        addSubview(appointmentTitleLabel)
        addSubview(editButton)
        addSubview(separatorLine)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(30)]-8-[v1(30)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dayAndTimeLabel, "v1":appointmentTitleLabel]))
        
        dayAndTimeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        appointmentTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        
        editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        editButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        
        separatorLine.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        separatorLine.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        separatorLine.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}
