//
//  SalonHomePage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-23.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class SalonHomePage: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blackColor()
        
        setupNavBar()
    }
    
    private func setupNavBar() {

        let titleView = UILabel(frame:CGRectMake(0, 0, self.navigationController!.navigationBar.frame.width, self.navigationController!.navigationBar.frame.height))
        
        titleView.textColor = UIColor.whiteColor()
        titleView.text = "asadsf Home"
        titleView.textAlignment = .Center
        
        self.navigationItem.titleView = titleView
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
}

class SalonImageCell: BaseTableViewCell {
    
    let salonImage:UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .ScaleAspectFit
        iv.image = UIImage(named: )
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(salonImage)
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":salonImage]))
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":salonImage]))

        
    }
    
}
