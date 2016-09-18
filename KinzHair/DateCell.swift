//
//  dayCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-29.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class DateCell: BaseCollectionViewCell {
    
    let dayLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 18)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 20)
        label.textAlignment = .center
        label.textColor = UIColor.white
        return label
    }()
    
    override func setupViews() {
        addSubview(dayLabel)
        addSubview(dateLabel)
        
        backgroundColor = UIColor.black
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1(30)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":dayLabel, "v1":dateLabel]))
        
        dayLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        dateLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
    }
    
    
}
