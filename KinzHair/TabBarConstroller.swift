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
        
        let salonReservationPage = ChoosingServiceController()
        let serviceNavCon = UINavigationController(rootViewController: salonReservationPage)
        serviceNavCon.title = "Reservation"
        
        let userInfoPage = UserInfoPage()
        let userInfoNavCon = UINavigationController(rootViewController: userInfoPage)
        userInfoNavCon.title = "Me"
        
        UINavigationBar.appearance().barTintColor = UIColor.black

        viewControllers = [homeNavCon, serviceNavCon, userInfoNavCon]
        UITabBar.appearance().barTintColor = UIColor.black

    }
}
