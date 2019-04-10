//
//  clanListView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/4/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class clanListView: UIView {
    
    var firstClan = UIView()
    var firstClanName = UIButton()
    var firstClanTag = UILabel()
    var firstClanRemove = UIButton()
    var firstEmpty = UILabel()
    
    var secondClan = UIView()
    var secondClanName = UIButton()
    var secondClanTag = UILabel()
    var secondClanRemove = UIButton()
    var secondEmpty = UILabel()
    
    var thirdClan = UIView()
    var thirdClanName = UIButton()
    var thirdClanTag = UILabel()
    var thirdClanRemove = UIButton()
    var thirdEmpty = UILabel()
    
    var clanTagRemove = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(firstClan)
        setUpView(view: firstClan, topAnchor: self.topAnchor, clanTag: firstClanTag, clanName: firstClanName, removeClan: firstClanRemove, isEmptyLabel: firstEmpty)
        firstClanRemove.addTarget(self, action: #selector(removeFirst), for: .touchUpInside)
        
        addSubview(secondClan)
        setUpView(view: secondClan, topAnchor: firstClan.bottomAnchor, clanTag: secondClanTag, clanName: secondClanName, removeClan: secondClanRemove, isEmptyLabel: secondEmpty)
        secondClanRemove.addTarget(self, action: #selector(removeSecond), for: .touchUpInside)
        
        addSubview(thirdClan)
        setUpView(view: thirdClan, topAnchor: secondClan.bottomAnchor, clanTag: thirdClanTag, clanName: thirdClanName, removeClan: thirdClanRemove, isEmptyLabel: thirdEmpty)
        thirdClanRemove.addTarget(self, action: #selector(removeThird), for: .touchUpInside)
        
        addExistingClans()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUpView(view: UIView, topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, clanTag: UILabel, clanName: UIButton, removeClan: UIButton, isEmptyLabel: UILabel) {
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        view.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33).isActive = true
        
        view.addSubview(clanName)
        view.addSubview(removeClan)
        view.addSubview(clanTag)
        view.addSubview(isEmptyLabel)
        
        if clanTag.text == nil {
            labelEqualParentSize(label: isEmptyLabel, view: view)
            isEmptyLabel.text = "Empty Slot"
            isEmptyLabel.textAlignment = .center
        } else {
            isEmptyLabel.isHidden = true
        }
    }
    
    // adds the existing clans to the list
    func addExistingClans() {
        let clansArray = UserDefaults.standard.object(forKey: "myClans") as! [String]
        for each in clansArray {
            addClan(tag: each)
        }
    }
    
    // adds a clan into an avialable view
    func addClan(tag: String) {
        if firstClanTag.text == nil {
            changeView(view: firstClan, clanTag: tag, clanTagLabel: firstClanTag, clanNameButton: firstClanName, removeButton: firstClanRemove, isEmpty: firstEmpty)
        } else if secondClanTag.text == nil {
            changeView(view: secondClan, clanTag: tag, clanTagLabel: secondClanTag, clanNameButton: secondClanName, removeButton: secondClanRemove, isEmpty: secondEmpty)
        } else if thirdClanTag.text == nil {
            changeView(view: thirdClan, clanTag: tag, clanTagLabel: thirdClanTag, clanNameButton: thirdClanName, removeButton: thirdClanRemove, isEmpty: thirdEmpty)
        } else {
            // has all three clans, and can't add another one
        }
        
    }
    
    // updates the view with a clan
    func changeView(view: UIView, clanTag: String, clanTagLabel: UILabel, clanNameButton: UIButton, removeButton: UIButton, isEmpty: UILabel) {
        
        // Set value of UI Objects
        clanTagLabel.text = "Tag: #" + clanTag
        clanTagLabel.backgroundColor = .blue
        
        clanNameButton.setTitle(GlobalVariables.activeClan.clanName, for: .normal)
        clanNameButton.backgroundColor = .red
        
        removeButton.setTitle("x", for: .normal)
        removeButton.backgroundColor = UIColor.red.withAlphaComponent(0.4)
        
        isEmpty.isHidden = true
        
        // set up Constraints
        clanNameButton.translatesAutoresizingMaskIntoConstraints = false
        clanNameButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        clanNameButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        clanNameButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7).isActive = true
        clanNameButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        
        clanTagLabel.translatesAutoresizingMaskIntoConstraints = false
        clanTagLabel.topAnchor.constraint(equalTo: clanNameButton.bottomAnchor).isActive = true
        clanTagLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        clanTagLabel.widthAnchor.constraint(equalTo: clanNameButton.widthAnchor).isActive = true
        clanTagLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        removeButton.leftAnchor.constraint(equalTo: clanNameButton.rightAnchor).isActive = true
        removeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        removeButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        
    }
 
    @objc func removeFirst() {
        deleteClan(clanTag: firstClanTag.text!.replacingOccurrences(of: "Tag: #", with: "")) 
    }
    
    @objc func removeSecond() {
        deleteClan(clanTag: secondClanTag.text!.replacingOccurrences(of: "Tag: #", with: ""))
    }
    
    @objc func removeThird() {
        deleteClan(clanTag: thirdClanTag.text!.replacingOccurrences(of: "Tag: #", with: ""))
    }
    
}






func labelEqualParentSize(label: UILabel, view: UIView) {
    label.translatesAutoresizingMaskIntoConstraints = false
    
    label.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    label.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    label.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    label.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
}
