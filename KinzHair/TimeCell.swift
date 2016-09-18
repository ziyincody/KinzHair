//
//  TimeCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-29.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class TimeCell: BaseCollectionViewCell {
    
    let timeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    override func setupViews() {
        addSubview(timeLabel)
        
        backgroundColor = UIColor.black
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeLabel]))
        
        timeLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    
}
