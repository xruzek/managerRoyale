//
//  CustomCell.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/5/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    var name : String?
    var cellCount : Int?
    var trophies : Int?
    var donations : Int?
    var warScore : Int?
    
    var nameLabel : UILabel = {
        var nameView = UILabel()
        nameView.translatesAutoresizingMaskIntoConstraints = false
        return nameView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(nameLabel)
        
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        
    }
    
    override func layoutSubviews() {
        if let name = name {
            nameLabel.text = name
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
