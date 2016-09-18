//
//  ServiceCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-28.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ServiceCell: BaseTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var choosingServiceController:ChoosingServiceController?
    
    static let cellId = "cellId"
    
    var services:[String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    let cellTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size: 15)
        label.textColor = UIColor.black
        label.text = "CHOOSE YOUR SERVICE"
        return label
    }()
    
    lazy var collectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(StylistCell.self, forCellWithReuseIdentifier: ServiceCell.cellId)
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(cellTitle)
        addSubview(collectionView)
        
        cellTitle.topAnchor.constraint(equalTo: self.topAnchor,constant: 8).isActive = true
        cellTitle.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20).isActive = true
        cellTitle.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 8).isActive = true
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return services?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServiceCell.cellId, for: indexPath) as! StylistCell
        
        cell.stylistNameLabel.text = services?[(indexPath as NSIndexPath).item]
        
        if cell.stylistNameLabel.text != "SELECT" && cell.stylistNameLabel.text == choosingServiceController?.selectedStylists[self.tag] {
            cell.stylistNameLabel.textColor = UIColor.red
        } else {
            cell.stylistNameLabel.textColor = UIColor.black
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let stylist = services?[(indexPath as NSIndexPath).item] {
            
            if stylist == choosingServiceController?.selectedStylists[self.tag] {
                choosingServiceController?.selectedStylists[self.tag] = "SELECT"
                choosingServiceController?.serviceTable.reloadData()
                collectionView.reloadData()
            } else {
                choosingServiceController?.selectedStylists[self.tag] = stylist
                choosingServiceController?.serviceTable.reloadData()
                collectionView.reloadData()
            }
        }
    }
}


