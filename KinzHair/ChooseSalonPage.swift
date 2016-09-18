//
//  ChooseSalonPage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-31.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ChooseSalonPage: UIViewController, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let names = ["Kinz", "Duzz", "hello"]
    let cellId = "cellId"
    
    lazy var searchResultsController:UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
        searchController.searchBar.barStyle = .black
        //searchController.searchBar.backgroundColor = UIColor.clearColor()
        searchController.searchBar.barTintColor = UIColor.clear
        return searchController
    }()
    
    lazy var resultsTable:UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = UIColor.black
        table.separatorStyle = .none
        table.register(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        return table
    }()
    
    lazy var searchView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let enterLabel:CustomLabel = {
        let label = CustomLabel()
        label.text = "Enter Name or Address of Salon"
        label.font = UIFont(name: "CenturyGothic", size: 20)
        return label
    }()
    
    lazy var enterButton:CustomButton = {
        let button = CustomButton(type: .system)
        button.setTitle("Enter", for: UIControlState())
        button.titleLabel?.font = UIFont(name: "CenturyGothic", size: 20)
        button.addTarget(self, action: #selector(goToSalonPage), for: .touchUpInside)
        return button
    }()
    
    func goToSalonPage() {
        
        self.present(TabBarConstroller(), animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.black
        
        setupViewConstraints()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = UIColor.clear
        
        cell.textLabel?.textColor = UIColor.white
        
        cell.textLabel?.text = names[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        
    }
}



extension ChooseSalonPage {
    
    func setupViewConstraints() {
        view.addSubview(enterLabel)
        view.addSubview(searchView)
        view.addSubview(resultsTable)
        view.addSubview(enterButton)
        searchView.addSubview(searchResultsController.searchBar)
        
        enterLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24).isActive = true
        enterLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        enterLabel.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        searchView.topAnchor.constraint(equalTo: enterLabel.bottomAnchor, constant: 12).isActive = true
        searchView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        searchView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        resultsTable.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 12).isActive = true
        resultsTable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultsTable.widthAnchor.constraint(equalToConstant: 200).isActive = true
        resultsTable.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        enterButton.topAnchor.constraint(equalTo: resultsTable.bottomAnchor, constant: 12).isActive = true
        enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        enterButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
        enterButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
