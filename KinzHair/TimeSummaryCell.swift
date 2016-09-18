//
//  ServiceSummaryCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-29.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class TimeSummaryCell: BaseTableViewCell {
    
    var appointment:HairSalon.Appointment?
    
    let durationLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .right
        label.textColor = UIColor.black
        label.text = "Duration:"
        return label
    }()
    
    let timeEndsLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .right
        label.textColor = UIColor.black
        label.text = "Time Ends:"
        return label
    }()
    
    let duration:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.text = "30 min"
        return label
    }()
    
    let timeServiceEnds:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Century Gothic", size: 15)
        label.textAlignment = .left
        label.textColor = UIColor.black
        label.text = "10:30 am"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(durationLabel)
        addSubview(timeEndsLabel)
        addSubview(duration)
        addSubview(timeServiceEnds)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(30)]-10-[v1(30)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":durationLabel, "v1":timeEndsLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[v0(30)]-10-[v1(30)]-10-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":duration, "v1":timeServiceEnds]))

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0(100)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":durationLabel, "v1":duration]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-50-[v0(100)]-10-[v1]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":timeEndsLabel, "v1":timeServiceEnds]))
    }
}
