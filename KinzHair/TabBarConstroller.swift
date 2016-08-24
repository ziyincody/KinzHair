//
//  TabBarConstroller.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-23.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class TabBarConstroller: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let salonHomeCon = SalonHomePage()
        let homeNavCon = UINavigationController(rootViewController: salonHomeCon)
        homeNavCon.title = "Home"
        
        UINavigationBar.appearance().barTintColor = UIColor.blackColor()
        
        viewControllers = [homeNavCon]
        UITabBar.appearance().barTintColor = UIColor.blackColor()

    }
}