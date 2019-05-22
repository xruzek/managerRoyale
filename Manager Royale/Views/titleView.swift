//
//  titleView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/4/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class titleView: UIView {
    var title = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUp(view: UIView, name: String) {
        translatesAutoresizingMaskIntoConstraints = false
        
        topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        heightAnchor.constraint(equalToConstant: GlobalVariables.controllerTitleHeight).isActive = true
        //backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        
        addSubview(title)
        title.sizeToFit()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5).isActive = true
        
        title.text = name
        title.font = UIFont(name: Fonts.lighterFont, size: 25)
        
        
    }

    func addButton (newButton: UIButton) {
        addSubview(newButton)
        newButton.translatesAutoresizingMaskIntoConstraints = false
        newButton.topAnchor.constraint(equalTo: title.topAnchor).isActive = true
        newButton.leftAnchor.constraint(equalTo: title.rightAnchor, constant: 4).isActive = true
        newButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        newButton.heightAnchor.constraint(equalTo: title.heightAnchor).isActive = true
        
        
    }
}
