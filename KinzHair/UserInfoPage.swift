//
//  MePage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-04.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class UserInfoPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let appointmentInfoCellId = "appointmentInfoCellId"
    let userInfoCell = "userInfoCell"
    let headerViewId = "headerViewId"
    
    lazy var userInfoTable:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(AppointmentInfoCell.self, forCellReuseIdentifier: self.appointmentInfoCellId)
        tableView.register(UserInfoCell.self, forCellReuseIdentifier: self.userInfoCell)
        tableView.register(MeHeaderView.self, forHeaderFooterViewReuseIdentifier: self.headerViewId)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = 60
        tableView.estimatedRowHeight = 84
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        
        view.addSubview(userInfoTable)
        
        view.addConstraintsWithFormat("V:|[v0]|", views: userInfoTable)
        view.addConstraintsWithFormat("H:|[v0]|", views: userInfoTable)
    }
    
    func setupNavBar() {
        
        let titleView = UILabel(frame:CGRect(x: 0, y: 0, width: self.navigationController!.navigationBar.frame.width, height: self.navigationController!.navigationBar.frame.height))
        
        titleView.textColor = UIColor.white
        titleView.text = "Me"
        titleView.font = UIFont(name: "Century Gothic", size: 25)
        titleView.textAlignment = .center
        
        self.navigationItem.titleView = titleView
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.headerViewId) as! MeHeaderView
        
        if section == 0 {
            headerView.sectionTitle.text = "Ongoing Appointment"
        } else {
            headerView.sectionTitle.text = "Account Info"
        }
        
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 1 {
            
            return 1
            
        } else {
            
            return 2
            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: self.userInfoCell, for: indexPath)
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: self.appointmentInfoCellId, for: indexPath)
            
            return cell
        }
    }
}

class MeHeaderView: UITableViewHeaderFooterView {
    
    var sectionTitle:UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = UIColor.black
        title.font = UIFont(name: "Century Gothic", size: 18)
        return title
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(sectionTitle)
        
        sectionTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        sectionTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 24).isActive = true
        sectionTitle.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
}
