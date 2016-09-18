//
//  MenuBar.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-09-04.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let menus = ["DASHBOARD", "CALENDER", "CLIENTS", "SETTINGS"]
    
    var managementPage:ManagementPage?
    
    lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    let whiteBorder:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let cellId = "cellId123"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        addSubview(collectionView)
        addSubview(whiteBorder)
        
        addConstraintsWithFormat("H:|-16-[v0]-10-|", views: collectionView)
        addConstraintsWithFormat("V:|[v0]|", views: collectionView)
        
        whiteBorder.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        whiteBorder.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        whiteBorder.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        whiteBorder.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        
        let selectedIndexPath = IndexPath(item: 0, section: 0)
        collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: UICollectionViewScrollPosition())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        
        cell.menuName.text = menus[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        managementPage?.scrollToMenuIndex(indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (frame.width - 26) / 4, height: frame.height)
    }
    
}

class MenuCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let menuName:UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "CenturyGothic", size:13)
        return label
    }()
    
    override var isHighlighted: Bool {
        didSet {
            
            menuName.layer.borderWidth = isHighlighted ? 1 : 0
            menuName.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    override var isSelected: Bool {
        didSet {
            
            menuName.layer.borderWidth = isSelected ? 1 : 0
            menuName.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    func setupViews() {
        addSubview(menuName)
        
        addConstraint(NSLayoutConstraint(item: menuName, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: menuName, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
    }
}


