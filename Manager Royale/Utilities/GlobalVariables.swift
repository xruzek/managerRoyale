//
//  GlobalVariables.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation
import UIKit

struct GlobalVariables {
    static var activeClan = theClan()
    static var sortTypes: Int = 7
    static var clansArray = [String]()
    static var cellHeaderHeight: CGFloat = 150
    static var cellHeight: CGFloat = 90
    static var cellOffset: CGFloat = 10
    
    static var memberTapped: players = players()

}

// Scroll view class
/*
 class MemberInfoScrollView: UIScrollView {
 override init(frame: CGRect) {
 super.init(frame: frame)
 let newView = contentView()
 
 self.addSubview(newView)
 newView.setUp(view: self)
 }
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 
 func setUpScrollView(view: UIView) {
 
 translatesAutoresizingMaskIntoConstraints = false
 
 leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
 trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
 bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
 //topAnchor.constraint(equalTo: view.bottomAnchor, constant: view.frame.size.height/2.4).isActive = true
 topAnchor.constraint(equalTo: view.bottomAnchor, constant: 500).isActive = true
 
 }
 
 }
 
 class contentView: UIView {
 override init(frame: CGRect) {
 super.init(frame: frame)
 
 
 }
 required init?(coder aDecoder: NSCoder) {
 fatalError("init(coder:) has not been implemented")
 }
 
 func setUp(view: UIView) {
 backgroundColor = UIColor.green.withAlphaComponent(0.5)
 
 translatesAutoresizingMaskIntoConstraints = false
 
 leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
 trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
 bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
 topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
 }
 
 }
 */
