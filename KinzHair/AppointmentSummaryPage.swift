//
//  AppointmentSummaryPage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-30.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class AppointmentSummaryPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    
    let journeyImageView:UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "journey line3")
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    lazy var confirmationView:ConfirmationView = {
        let view = ConfirmationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var summaryTable:UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        tableView.register(AppointmentSummaryCell.self, forCellReuseIdentifier: self.cellId)
        tableView.rowHeight = 90
        tableView.sectionHeaderHeight = 50
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return HairSalon.appointmentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}

extension AppointmentSummaryPage {
    
    fileprivate func setupViews() {
        
        view.addSubview(journeyImageView)
        view.addSubview(confirmationView)
        view.addSubview(summaryTable)
        
        journeyImageView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        journeyImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        journeyImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 8).isActive = true
        journeyImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -8).isActive = true
        
        confirmationView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor).isActive = true
        confirmationView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        confirmationView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        confirmationView.confirmButton.addTarget(self, action: #selector(confirmAppointment), for: .touchUpInside)
        
        summaryTable.topAnchor.constraint(equalTo: journeyImageView.bottomAnchor).isActive = true
        summaryTable.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        summaryTable.bottomAnchor.constraint(equalTo: confirmationView.topAnchor).isActive = true
    }
    
    func confirmAppointment() {
        
    }
}
