//
//  TimeHeaderView.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-28.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class TimeHeaderView: UITableViewHeaderFooterView {
    
    var chooseServiceController:ChoosingServiceController?
    
    let serviceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size: 30)
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
        
        addSubview(serviceLabel)
        
        serviceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        serviceLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        serviceLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
