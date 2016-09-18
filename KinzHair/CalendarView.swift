//
//  CalendarView.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-04.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class CalendarView: BaseCollectionViewCell, UITableViewDataSource,UITableViewDelegate {
    
    let cellId = "cellId"
    let headerId = "headerId"
    
    let times = ["8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00"]
    
    lazy var calenderTable: UITableView = {
        
        let cv = UITableView(frame: .zero, style: .plain)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(calenderTable)
        calenderTable.register(CalenderCell.self, forCellReuseIdentifier: self.cellId)
        calenderTable.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: self.headerId)
        calenderTable.cellLayoutMarginsFollowReadableWidth = false
        calenderTable.sectionHeaderHeight = 60
        calenderTable.separatorStyle = .none
        
        addConstraintsWithFormat("H:|[v0]|", views: calenderTable)
        addConstraintsWithFormat("V:|[v0]|", views: calenderTable)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 36
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.headerId) as! HeaderView
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as! CalenderCell
        
        cell.name.text = nil
        
        if (indexPath as NSIndexPath).row % 4 == 0 {
            cell.name.text = times[(indexPath as NSIndexPath).row / 4]
            cell.topBorderHeightConstraint?.constant = 2
        } else {
            cell.topBorderHeightConstraint?.constant = 1
        }
        
        return cell
    }
}

class HeaderView: UITableViewHeaderFooterView {
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = UIColor.white
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dateLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "wednesday"
        label.textColor = UIColor.black
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    var bottomBorder:UIView = {
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.backgroundColor = UIColor.black
        return separator
    }()
    
    fileprivate func setupViews() {
        
        addSubview(dateLabel)
        addSubview(bottomBorder)
        
        dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dateLabel.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        bottomBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        bottomBorder.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        bottomBorder.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        bottomBorder.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
}

