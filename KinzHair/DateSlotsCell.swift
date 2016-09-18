//
//  DateCell.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-29.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class DateCell: BaseTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    lazy var collectionView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: self.cellId)
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
        
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellId, forIndexPath: indexPath)
        
        cell.backgroundColor = UIColor.yellowColor()
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(50, 50)
    }
    
    
}
