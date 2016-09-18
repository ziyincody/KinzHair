//
//  ClientList.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-17.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ClientList: BaseCollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    
    let names = [["Kang Ye Bin":"Female"], ["Fish":"Female"], ["Shark":"Female"]]
    
    lazy var clientList: UITableView = {
        let cv = UITableView(frame: .zero, style: .plain)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    override func setupViews() {
        super.setupViews()
        
        addSubview(clientList)
        clientList.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        
        addConstraintsWithFormat("H:|[v0]|", views: clientList)
        addConstraintsWithFormat("V:|[v0]|", views: clientList)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = clientList.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let client = names[indexPath.row]
        
        for (name,gender) in client {
            
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = gender
        }
        
        return cell
    }
}
