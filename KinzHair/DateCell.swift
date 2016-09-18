//
//  dayCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-29.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class dateCell: BaseCollectionViewCell {
    
    let dayLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 20)
        label.textAlignment = .Center
        return label
    }()
    
    let dateLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 20)
        label.textAlignment = .Center
        return label
    }()
    
    override func setupViews() {
        addSubview(stylistImageView)
        addSubview(stylistNameLabel)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0][v1(30)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":stylistImageView, "v1":stylistNameLabel]))
        
        stylistImageView.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        stylistNameLabel.widthAnchor.constraintEqualToAnchor(self.widthAnchor).active = true
        
    }
    
    
}
