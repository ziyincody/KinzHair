//
//  ChoosingServiceController.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-27.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ChoosingServiceController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let cellId = "cellId"
    static let headerViewId = "headerId"
    
    var boolArray = [Bool]()
    
    var categories = [String]()
    
    var stylists = [[String]]()
    
    var selectedStylists = [String]()
    
    lazy var serviceTable:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(ServiceCell.self, forCellReuseIdentifier: ChoosingServiceController.cellId)
        tableView.register(ServiceHeaderView.self, forHeaderFooterViewReuseIdentifier: ChoosingServiceController.headerViewId)
        tableView.rowHeight = 180
        tableView.sectionHeaderHeight = 70
        
        return tableView
    }()
    
    let journeyImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "journey line1")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var resetAndNextView:ResetAndNextView = {
        let view = ResetAndNextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.choosingServiceController = self
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupViews()
        
        self.view.backgroundColor = UIColor.black
        
        if let cat = HairSalon.categories, let sty = HairSalon.stylists {
            categories = cat
            stylists = sty
            
            boolArray = Array(repeating: false, count: categories.count)
            selectedStylists = Array(repeating: "SELECT", count: categories.count)
        }
    }
    
    fileprivate func setupNavBar() {
        
        let titleView = UILabel(frame:CGRect(x: 0, y: 0, width: self.navigationController!.navigationBar.frame.width, height: self.navigationController!.navigationBar.frame.height))
        
        titleView.textColor = UIColor.white
        titleView.text = "Choose Service"
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
        resetAndNextView.resetButton.addTarget(self, action: #selector(resetStylists), for: .touchUpInside)
        resetAndNextView.nextButton.addTarget(self, action: #selector(goChooseTime), for: .touchUpInside)

        resetAndNextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        serviceTable.topAnchor.constraint(equalTo: journeyImageView.bottomAnchor).isActive = true
        serviceTable.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        serviceTable.bottomAnchor.constraint(equalTo: resetAndNextView.topAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChoosingServiceController.headerViewId) as! ServiceHeaderView
        
        view.chooseServiceController = self
        view.selectedButton.tag = section
        view.selectedLabel.text = selectedStylists[section]
        
        if (selectedStylists[section] == "SELECT") && (!boolArray[section])  {
            view.selectedButton.setImage(UIImage(named: "add button"), for: UIControlState())
        } else {
            view.selectedButton.setImage(UIImage(named: "minus"), for: UIControlState())
        }
        
        if let categories = HairSalon.categories {
            
            view.chooseServiceLabel.text = categories[section]
        }
        
        return view
    }
    
    func selectedButtonTapped(_ sender:UIButton) {
        
        boolArray[sender.tag] = !boolArray[sender.tag]
        
        serviceTable.beginUpdates()
        serviceTable.reloadSections(IndexSet(integer:sender.tag), with: .fade)
        serviceTable.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return boolArray[section] == true ? 1 : 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChoosingServiceController.cellId, for: indexPath) as! ServiceCell
        
        cell.choosingServiceController = self
        cell.services = stylists[(indexPath as NSIndexPath).section]
        cell.tag = (indexPath as NSIndexPath).section
        
        return cell
    }
    
    func resetStylists() {
        selectedStylists = Array(repeating: "SELECT", count: categories.count)
        serviceTable.reloadData()
    }
    
    func goChooseTime() {
        
        HairSalon.appointmentArray.removeAll()
        
        for i in 0..<selectedStylists.count {
            
            let selectedStylist = selectedStylists[i]
            
            if selectedStylist != "SELECT" {
                
                let appointment = HairSalon.Appointment(category: categories[i], stylist: selectedStylist)
                
                HairSalon.appointmentArray.append(appointment)
            }
        }
        self.navigationController?.pushViewController(ChoosingTimeController(), animated: true)
    }
}
