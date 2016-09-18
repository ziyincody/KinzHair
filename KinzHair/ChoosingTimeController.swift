//
//  ChoosingTimeController.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-28.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ChoosingTimeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dateCellId = "dateCellId"
    let timeSlotCellId = "timeSlotId"
    let timeSummaryCellId = "timeSummaryId"
    let viewId = "viewId"
    
    var chosenServices:[HairSalon.Appointment] = []
    
    var days = [DateComponents]()
    
    var hours = ["9:00 am", "11:30 am", "4:30 pm"]
    
    func setUpCalender() {
        let calender = Calendar.current
        
        for i in 0..<31 {
            
            let future = (calender as NSCalendar).date(byAdding: .day, value: i, to: Date(), options: [])
            let components = (calender as NSCalendar).components([.weekday,.day,.month,.year], from: future!)
            
            days.append(components)
        }
        
        for i in 0..<HairSalon.appointmentArray.count {
            
            HairSalon.appointmentArray[i].time = hours[0]
            HairSalon.appointmentArray[i].date = days[0]
        }
    }
    
    lazy var serviceTable:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(DateSlotsCell.self, forCellReuseIdentifier: self.dateCellId)
        tableView.register(TimeSlotsCell.self, forCellReuseIdentifier: self.timeSlotCellId)
        tableView.register(TimeSummaryCell.self, forCellReuseIdentifier: self.timeSummaryCellId)
        tableView.register(TimeHeaderView.self, forHeaderFooterViewReuseIdentifier: self.viewId)
        tableView.rowHeight = 90
        tableView.sectionHeaderHeight = 50
        
        return tableView
    }()
    
    let journeyImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "journey line2")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var resetAndNextView:ResetAndNextView = {
        let view = ResetAndNextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
        setUpCalender()
        
        chosenServices = HairSalon.appointmentArray
    }
    
    func resetChosenTime() {
        for i in 0..<HairSalon.appointmentArray.count {
            
            HairSalon.appointmentArray[i].time = hours[0]
            HairSalon.appointmentArray[i].date = days[0]
        }
    }
    
    func goAppointmentSummary() {
        
        self.navigationController?.pushViewController(AppointmentSummaryPage(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.viewId) as! TimeHeaderView
        
        let appointment = chosenServices[section]
        let service = appointment.category
        let stylist = appointment.stylist
        
        view.serviceLabel.text = "\(service) with: \(stylist)"
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return chosenServices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath as NSIndexPath).row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: dateCellId, for: indexPath) as! DateSlotsCell
            
            cell.choosingTimeController = self
            cell.appointment = HairSalon.appointmentArray[(indexPath as NSIndexPath).section]
            
            return cell
        }
        
        if (indexPath as NSIndexPath).row == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: timeSlotCellId, for: indexPath) as! TimeSlotsCell
            
            cell.hours = hours
            cell.appointment = HairSalon.appointmentArray[(indexPath as NSIndexPath).section]
            cell.choosingTimeController = self
            
            let appointment = HairSalon.appointmentArray[(indexPath as NSIndexPath).section]
            
            if let month = appointment.date.month, let day = appointment.date.day, let year = appointment.date.year {
                
                cell.selectedTimeLabel.text = "\(month).\(day), \(year) at \(appointment.time)"
            }
            
            return cell
        }
        
        if (indexPath as NSIndexPath).row == 2 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: timeSummaryCellId, for: indexPath) as! TimeSummaryCell
            
            cell.appointment = HairSalon.appointmentArray[(indexPath as NSIndexPath).section]
            return cell
        }
        
        return UITableViewCell()
    }
}


extension ChoosingTimeController {
    
    fileprivate func setupNavBar() {
        
        let titleView = UILabel(frame:CGRect(x: 0, y: 0, width: self.navigationController!.navigationBar.frame.width, height: self.navigationController!.navigationBar.frame.height))
        
        titleView.textColor = UIColor.white
        titleView.text = "Choose Time"
        titleView.font = UIFont(name: "Century Gothic", size: 25)
        titleView.textAlignment = .center
        
        self.navigationItem.titleView = titleView
    }
    
    fileprivate func setupViews() {
        
        view.addSubview(journeyImageView)
        view.addSubview(resetAndNextView)
        view.addSubview(serviceTable)
        
        journeyImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        journeyImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        journeyImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
        journeyImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8).isActive = true
        
        resetAndNextView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        resetAndNextView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        resetAndNextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        resetAndNextView.resetButton.addTarget(self, action: #selector(resetChosenTime), for: .touchUpInside)
        resetAndNextView.nextButton.addTarget(self, action: #selector(goAppointmentSummary), for: .touchUpInside)
        
        serviceTable.topAnchor.constraint(equalTo: journeyImageView.bottomAnchor).isActive = true
        serviceTable.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        serviceTable.bottomAnchor.constraint(equalTo: resetAndNextView.topAnchor).isActive = true
    }
}
