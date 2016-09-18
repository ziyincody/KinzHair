//
//  ResetAndNextView.swift
//  KinzHair
//
//  Created by Ziyin Wang on 2016-08-27.
//  Copyright © 2016 Ziyin Wang. All rights reserved.
//

import UIKit

class ResetAndNextView: UIView {
    
    var choosingServiceController:ChoosingServiceController?
    
    lazy var resetButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("RESET", for: UIControlState())
        return button
    }()
    
    lazy var nextButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "next"), for: UIControlState())
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        addSubview(resetButton)
        addSubview(nextButton)
        
        resetButton.topAnchor.constraint(equalTo: topAnchor,constant: 15).isActive = true
        resetButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        resetButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        resetButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

        nextButton.topAnchor.constraint(equalTo: resetButton.bottomAnchor,constant: 10).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }
}
