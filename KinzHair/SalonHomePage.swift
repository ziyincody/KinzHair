//
//  SalonHomePage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-23.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class SalonHomePage: UITableViewController {
    
    static let salonImageId = "salonImageId"
    static let salonDescriptionId = "salonDecriptionId"
    static let salonLocationId = "salonLocationId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        tableView.register(SalonImageCell.self, forCellReuseIdentifier: SalonHomePage.salonImageId)
        tableView.register(SalonDescriptionCell.self, forCellReuseIdentifier: SalonHomePage.salonDescriptionId)
        tableView.register(SalonLocationCell.self, forCellReuseIdentifier: SalonHomePage.salonLocationId)
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //Data for testing
        HairSalon.categories = ["MEN CUT", "WOMEN CUT", "HAIR COLOUR", "PERMING"]
        HairSalon.stylists = [["SHARK","DOLPHIN"],["GIRL", "GIRL2"], ["GIRL3", "G4"], ["G5", "G6"]];
        
        setupNavBar()
    }
    
    fileprivate func setupNavBar() {
        
        let titleView = UILabel(frame:CGRect(x: 0, y: 0, width: self.navigationController!.navigationBar.frame.width, height: self.navigationController!.navigationBar.frame.height))
        
        titleView.textColor = UIColor.white
        titleView.text = "asadsf Home"
        titleView.font = UIFont(name: "Century Gothic", size: 25)
        titleView.textAlignment = .center
        
        self.navigationItem.titleView = titleView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SalonHomePage.salonImageId, for: indexPath) as! SalonImageCell
            
            return cell
        }
        
        if (indexPath as NSIndexPath).row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SalonHomePage.salonDescriptionId, for: indexPath) as! SalonDescriptionCell
            
            return cell
        }
        
        if (indexPath as NSIndexPath).row == 3 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: SalonHomePage.salonLocationId, for: indexPath) as! SalonLocationCell
            
            return cell
        }
        
        return UITableViewCell()
    }
}

