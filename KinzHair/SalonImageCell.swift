//
//  SalonImageCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-27.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class SalonImageCell: BaseTableViewCell {
    
    let salonImage:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(named: "Sample Cover Photo")
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(salonImage)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":salonImage]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":salonImage]))
    }
}

class SalonDescriptionCell: BaseTableViewCell  {
    
    let descriptions:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hair salon was established on 2005 by two passionate hair stylists Shark and Dolphin. They both have over 10 years experience and are always up to date with the latest trends."
        label.numberOfLines = 0
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(descriptions)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":descriptions]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":descriptions]))
    }
}

class StoreHoursCell: BaseTableViewCell {
    
    let storeHoursLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Store Hours"
        label.font = UIFont(name: "Century Gothic", size: 20)
        return label
    }()
//    
//    let storeHoursLabel:UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Store Hours"
//        label.font = UIFont.systemFontOfSize(20)
//        return label
//    }()
//    
//    let storeHoursLabel:UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Store Hours"
//        label.font = UIFont.systemFontOfSize(20)
//        return label
//    }()
//    
//    let storeHoursLabel:UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Store Hours"
//        label.font = UIFont.systemFontOfSize(20)
//        return label
//    }()
}

class SalonLocationCell: BaseTableViewCell {
    
    let locationLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Location:"
        label.font = UIFont(name: "Century Gothic", size: 20)
        return label
    }()
    
    let addressLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "154 Seamarket Ave"
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    let cityLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "North York,"
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    let postalCodeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "M2H 4K2"
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    let phoneNumberLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "647-681-8661"
        label.font = UIFont(name: "Century Gothic", size: 15)
        return label
    }()
    
    let mapImage:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "Sample Map")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(locationLabel)
        addSubview(addressLabel)
        addSubview(cityLabel)
        addSubview(postalCodeLabel)
        addSubview(phoneNumberLabel)
        addSubview(mapImage)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-8-[v0(30)]-10-[v1(30)]-8-[v2]-8-[v3]-8-[v4(30)]-10-[v5(200)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":locationLabel,"v1":addressLabel,"v2":cityLabel,"v3":postalCodeLabel,"v4":phoneNumberLabel,"v5":mapImage]))
        
        mapImage.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        locationLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        addressLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        cityLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        postalCodeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        phoneNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
    }
}

























