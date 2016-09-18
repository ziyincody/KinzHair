//
//  TimeCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-29.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit


class TimeCell: BaseTableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource {
    
    let cellId = "cellId"
    
    var hours:[String] = []
    
    lazy var collectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.registerClass(DateCell.self, forCellWithReuseIdentifier: self.cellId)
        collectionView.backgroundColor = UIColor.blackColor()
        return collectionView
    }()
    
    let monthLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size: 15)
        label.textColor = UIColor.whiteColor()
        label.text = "August"
        return label
    }()
    
    override func setupViews() {
        super.setupViews()

        backgroundColor = UIColor.blackColor()
        
        addSubview(monthLabel)
        addSubview(collectionView)
        
        monthLabel.topAnchor.constraintEqualToAnchor(self.topAnchor,constant: 5).active = true
        monthLabel.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        monthLabel.heightAnchor.constraintEqualToConstant(20).active = true
        
        collectionView.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor,constant: -8).active = true
        collectionView.leftAnchor.constraintEqualToAnchor(self.leftAnchor,constant: 20).active = true
        collectionView.rightAnchor.constraintEqualToAnchor(self.rightAnchor,constant: -20).active = true
        collectionView.heightAnchor.constraintEqualToConstant(60).active = true
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 30
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellId, forIndexPath: indexPath) as! DateCell
        
        cell.dayLabel.text = {
            switch days[indexPath.item].weekday {
            case 1:
                return "MON"
            case 2:
                return "TUE"
            case 3:
                return "WED"
            case 4:
                return "TUR"
            case 5:
                return "FRI"
            case 6:
                return "SAT"
            case 7:
                return "SUN"
            default:
                return "12345"
            }
        }()
        
        cell.dateLabel.text = String(days[indexPath.item].day)
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(50, 50)
    }
    
}








