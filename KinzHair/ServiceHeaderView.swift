//
//  ServiceHeaderView.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-28.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ServiceHeaderView: UITableViewHeaderFooterView {
    
    var chooseServiceController:ChoosingServiceController?
    
    let chooseServiceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size: 30)
        return label
    }()
    
    lazy var selectedButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "add button"), for: UIControlState())
        button.addTarget(self.chooseServiceController, action: #selector(ChoosingServiceController.selectedButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    let selectedLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Dolphin"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        label.textColor = UIColor.gray
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(chooseServiceLabel)
        addSubview(selectedButton)
        addSubview(selectedLabel)
        
        chooseServiceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        chooseServiceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        chooseServiceLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        selectedButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        selectedButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        selectedButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        selectedButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        selectedLabel.rightAnchor.constraint(equalTo: selectedButton.leftAnchor, constant: -10).isActive = true
        selectedLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        selectedLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}














