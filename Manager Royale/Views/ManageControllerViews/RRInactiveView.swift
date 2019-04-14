//
//  RRInactiveView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/14/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class RRInactiveView: UIView {

    var member = players()
    
    var viewHeight:CGFloat = 100
    
    var name = RRInfoLabel()
    var role = RRInfoLabel()
    var lastUpdated = RRInfoLabel()
    var lastPlayedLabel = RRInfoLabel()
    var lastPlayedAmount = RRInfoLabel()
    var warLabel = RRInfoLabel()
    var warAmount = RRInfoLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(name)
        addSubview(role)
        addSubview(lastUpdated)
        addSubview(lastPlayedLabel)
        addSubview(lastPlayedAmount)
        addSubview(warLabel)
        addSubview(warAmount)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    func setUp(newMember: players, topAnchor: NSLayoutYAxisAnchor, view: UIView) {
        member = newMember
        
        
    }
    
    
    
    
}
