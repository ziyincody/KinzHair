//
//  ManagementPage.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-04.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ManagementPage: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let calenderCellId = "calendercellId"
    let clientCellId = "clientCellId"
    let cellId = "cellId"
    
    lazy var menuBar:MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    lazy var stylistsBar:StylistsBar = {
        let mb = StylistsBar()
        return mb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "MANAGEMENT"
        
        self.view.backgroundColor = UIColor.white
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
        }
        
        collectionView?.register(CalendarView.self, forCellWithReuseIdentifier: calenderCellId)
        collectionView?.register(ClientList.self, forCellWithReuseIdentifier: clientCellId)
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.contentInset = UIEdgeInsetsMake(100, 0, 0, 0)
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        collectionView?.isPagingEnabled = true
        
        setupMenubar()
    }
    
    func scrollToMenuIndex(_ menuIndex:Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let identifier:String
        
        if (indexPath as NSIndexPath).item == 1 {
            identifier = self.calenderCellId
        }
            
        else if (indexPath as NSIndexPath).item == 2 {
            identifier = self.clientCellId
        } else {
            identifier = cellId
        }
        
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 100)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())
    }
    
    fileprivate func setupMenubar() {
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: menuBar)
        menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
        
        view.addSubview(stylistsBar)
        view.addConstraintsWithFormat("H:|[v0]|", views: stylistsBar)
        
        view.addConstraintsWithFormat("V:|[v0(50)][v1(50)]", views: menuBar,stylistsBar)
        
        menuBar.managementPage = self
    }
}
