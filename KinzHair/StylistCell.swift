//
//  StylistsCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-28.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class StylistCell: BaseCollectionViewCell {
    
    let stylistImageView:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "long2")
        return iv
    }()
    
    let stylistNameLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    override func setupViews() {
        addSubview(stylistImageView)
        addSubview(stylistNameLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0][v1(30)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":stylistImageView, "v1":stylistNameLabel]))
        
        stylistImageView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        stylistNameLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
    }
    
    
}
