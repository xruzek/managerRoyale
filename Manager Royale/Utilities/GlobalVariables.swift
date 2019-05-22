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
    
    static var refreshClan: Bool = false
    static var refreshMember: Bool = false
    
    static var memberTapped: players = players()
    
    static var removedMembers = [String]()
    static var newMembers = [String]()

    static var labelHeight: CGFloat = 40
    static var littleLabelHeight: CGFloat = 17
    static var labelFontSize: CGFloat = 20
    
    static var controllerTitleHeight: CGFloat = 100
    
    static var inactiveMemberView: CGFloat = 4 * GlobalVariables.labelHeight + GlobalVariables.littleLabelHeight
    static var warViews: CGFloat = 5 * GlobalVariables.labelHeight + GlobalVariables.littleLabelHeight
    static var memberWarView: CGFloat = 5 * GlobalVariables.labelHeight
}

// Global addLine function
func globalAddLine(leftLabel: UILabel, rightLabel: UILabel, view: UIView) {
    let line = RRLabelLine()
    view.addSubview(line)
    line.setUp(leftAnchor: leftLabel.rightAnchor, rightAnchor: rightLabel.leftAnchor, centerAnchor: leftLabel.centerYAnchor)
}

// Better Global addLine function
func topMemberAddLine(leftAnchor: NSLayoutXAxisAnchor, rightAnchor: NSLayoutXAxisAnchor, view: UIView, label: UILabel) {
    let line = RRLabelLine()
    view.addSubview(line)
    line.setUp(leftAnchor: leftAnchor, rightAnchor: rightAnchor, centerAnchor: label.centerYAnchor)
}

// refresh view
func addRefeshView(topAnchor: NSLayoutYAxisAnchor, isClan: Bool, member: players? = players(), view: UIView) -> RRRefreshView {
    let refreshView = RRRefreshView()
    view.addSubview(refreshView)
    refreshView.setUp(topAnchor: topAnchor, view: view, isClan: isClan, newMember: member)
    return refreshView
}

// add an InfoLabel
func addLabel(view: UIView, topAnchor: NSLayoutYAxisAnchor, title: String, height: CGFloat? = 30) -> RRInfoLabel {
    let newLabel = RRInfoLabel()
    view.addSubview(newLabel)
    newLabel.setHeight(newHeight: height!)
    newLabel.setConstraints(topAnchor: topAnchor, view: view, sideLeft: true)
    newLabel.text = title
    return newLabel
}

// adds a whole line of Info Labels
func addInfoLine(scrollView: UIView, view: UIView, topAnchor: NSLayoutYAxisAnchor, title: String, amount: String) -> RRInfoLabel {
    let rightLabel = RRInfoLabel()
    let leftLabel = RRInfoLabel()
    
    scrollView.addSubview(rightLabel)
    scrollView.addSubview(leftLabel)
    
    leftLabel.setConstraints(topAnchor: topAnchor, view: view, sideLeft: true)
    leftLabel.text = title
    
    if amount != "NOAMOUNT" {
        globalAddLine(leftLabel: leftLabel, rightLabel: rightLabel, view: view)
         rightLabel.setConstraints(topAnchor: topAnchor, view: view, sideLeft: false)
        rightLabel.text = amount
    }
    return leftLabel
}
