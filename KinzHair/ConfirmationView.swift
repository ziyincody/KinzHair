//
//  ConfirmationView.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-31.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ConfirmationView: UIView {
    
    let confirmButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.black
        button.tintColor = UIColor.white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirm", for: UIControlState())
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(confirmButton)
        
        confirmButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
}
