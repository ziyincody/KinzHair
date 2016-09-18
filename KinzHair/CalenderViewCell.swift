//
//  CalenderViewCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-17.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class CalenderCell: BaseTableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var name:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size: 20)
        label.textAlignment = .center
        return label
    }()
    
    var separatorLine:UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor.black
        return separator
    }()
    
    var topBorder:UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor.black
        return separator
    }()
    
    var blackView:UIView = {
        let blackView = UIView()
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        return blackView
    }()
    
    var timerAndServiceLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "9:15 - 10:15 MEN'S CUT"
        label.textColor = UIColor.white
        label.font = UIFont(name: "CenturyGothic", size: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var clientLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.text = "Client Name:"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var topBorderHeightConstraint:NSLayoutConstraint?
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(name)
        addSubview(separatorLine)
        addSubview(blackView)
        addSubview(topBorder)
        
        blackView.addSubview(timerAndServiceLabel)
        blackView.addSubview(clientLabel)
        
        name.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        name.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        name.widthAnchor.constraint(equalToConstant: 100).isActive = true
        name.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        separatorLine.leftAnchor.constraint(equalTo: name.rightAnchor).isActive = true
        separatorLine.widthAnchor.constraint(equalToConstant: 2).isActive = true
        separatorLine.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
        
        blackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        blackView.leftAnchor.constraint(equalTo: separatorLine.rightAnchor).isActive = true
        blackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        timerAndServiceLabel.leftAnchor.constraint(equalTo: blackView.leftAnchor, constant: 8).isActive = true
        timerAndServiceLabel.topAnchor.constraint(equalTo: blackView.topAnchor).isActive = true
        timerAndServiceLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        timerAndServiceLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        clientLabel.leftAnchor.constraint(equalTo: blackView.leftAnchor, constant: 8).isActive = true
        clientLabel.topAnchor.constraint(equalTo: timerAndServiceLabel.bottomAnchor).isActive = true
        clientLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        clientLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        topBorder.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        topBorderHeightConstraint = topBorder.heightAnchor.constraint(equalToConstant: 1)
        topBorderHeightConstraint?.isActive = true
        topBorder.widthAnchor.constraint(equalToConstant: 1000).isActive = true
    }
}
