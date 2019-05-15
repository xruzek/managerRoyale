//
//  RRChangeClanView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 5/15/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRChangeClanView: UIView {
    
    
    var changeClanField = clanTagTextField()
    
    var viewHeight:CGFloat = 100
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(topAnchor: NSLayoutYAxisAnchor, view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.heightAnchor.constraint(equalToConstant: viewHeight).isActive = true
        
        let changeClanLabel = addInfoLine(scrollView: self, view: self, topAnchor: self.topAnchor, title: "New Clan Tag:", amount: "NOAMOUNT")
        
        
    }

}
