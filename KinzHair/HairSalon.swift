//
//  HairSalon.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-27.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class HairSalon: NSObject {
    
    static var salonName:String?
    
    static var salonEmail:String?
    
    static var hairSalonCoverImage:UIImage?
    
    static var hairSalonDescription: String?
    
    static var hairSalonAddress:String?
    
    static var hairSalonAddressCity:String?
    
    static var hairSalonPostalCode:String?
    
    static var hairSalonPhoneNumber:String?
    
    static var firstTimeSetHead:String?
    
    static var firstTimeSetTail:String?
    
    static var firstTimeSetTimeFrom:String?
    
    static var firstTimeSetTimeTo:String?
    
    static var secondTimeSetHead:String?
    
    static var secondTimeSetTail:String?
    
    static var secondTimeSetTimeFrom:String?
    
    static var secondTimeSetTimeTo:String?
    
    static var categories:[String]?
    
    static var stylists:[[String]]?
    
    static var appointmentArray:[Appointment] = []
    
    class Appointment {
        var category:String
        var stylist:String
        
        var date:DateComponents
        var time:String
        
        init(category:String, stylist:String) {
            self.category = category
            self.stylist = stylist
            self.date = DateComponents()
            self.time = ""
        }
    }
}
