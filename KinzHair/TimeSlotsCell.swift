//
//  TimeCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-29.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit


class TimeSlotsCell: BaseTableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource {
    
    let cellId = "cellId"
    
    var choosingTimeController:ChoosingTimeController?

    var hours:[String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var appointment:HairSalon.Appointment? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var collectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(TimeCell.self, forCellWithReuseIdentifier: self.cellId)
        collectionView.backgroundColor = UIColor.black
        return collectionView
    }()
    
    let cellTitle:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size: 15)
        label.textColor = UIColor.white
        label.text = "Available Times"
        return label
    }()
    
    let selectedTimeLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size: 15)
        label.textColor = UIColor.white
        label.text = "Day.Month Year at Time"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.black
        
        addSubview(cellTitle)
        addSubview(collectionView)
        addSubview(selectedTimeLabel)
        
        cellTitle.topAnchor.constraint(equalTo: self.topAnchor,constant: 5).isActive = true
        cellTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        cellTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        collectionView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20).isActive = true
        collectionView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20).isActive = true
        collectionView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        selectedTimeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -8).isActive = true
        selectedTimeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        selectedTimeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return hours != nil ? hours!.count : 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! TimeCell
        
        if let hour = hours?[(indexPath as NSIndexPath).item] {
            
            cell.timeLabel.text = hour
            
            if let appointment = self.appointment {
                
                if appointment.time == hour {
                    cell.timeLabel.backgroundColor = UIColor.white
                    cell.timeLabel.textColor = UIColor.black
                } else {
                    cell.timeLabel.backgroundColor = UIColor.black
                    cell.timeLabel.textColor = UIColor.white
                }
            }
        }
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let hour = hours?[(indexPath as NSIndexPath).item] {
            
            appointment?.time = hour
            choosingTimeController?.serviceTable.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 70, height: 25)
    }
    
}








