//
//  memberInfoController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/6/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class memberInfoController: UIViewController {
    var memberName = RRInfoLabel()
    var memberTag = RRInfoLabel()
    var lastBattleLabel = RRInfoLabel()
    var memberStatus = RRInfoLabel()
    var pastTenWarStats = RRInfoLabel()
    var winsLabel = RRInfoLabel()
    var winsAmount = RRInfoLabel()
    var playedLabel = RRInfoLabel()
    var playedAmount = RRInfoLabel()
    var missedLabel = RRInfoLabel()
    var missedAmount = RRInfoLabel()
    var cardsLabel = RRInfoLabel()
    var cardsAmount = RRInfoLabel()
    var collectionMissedLabel = RRInfoLabel()
    var collectionMissedAmount = RRInfoLabel()
    var donationLabel = RRInfoLabel()
    var donationAmount = RRInfoLabel()
    var recievedLabel = RRInfoLabel()
    var recievedAmount = RRInfoLabel()
    
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.contentSize = CGSize(width: Constants.screenWidth, height: 2000)
        return v
    }()
    
    var labelHeight:CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Members"
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black*/
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Do any additional setup after loading the view.
        //navigationController?.setNavigationBarHidden(true, animated: animated)
        
        view.backgroundColor = UIColor.white
        
        // Scrolling stuff
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(memberName)
        scrollView.addSubview(memberTag)
        scrollView.addSubview(lastBattleLabel)
        scrollView.addSubview(memberStatus)
        scrollView.addSubview(pastTenWarStats)
        scrollView.addSubview(winsLabel)
        scrollView.addSubview(winsAmount)
        scrollView.addSubview(playedLabel)
        scrollView.addSubview(playedAmount)
        scrollView.addSubview(missedLabel)
        scrollView.addSubview(missedAmount)
        scrollView.addSubview(cardsLabel)
        scrollView.addSubview(cardsAmount)
        scrollView.addSubview(collectionMissedLabel)
        scrollView.addSubview(collectionMissedAmount)
        scrollView.addSubview(donationLabel)
        scrollView.addSubview(donationAmount)
        scrollView.addSubview(recievedLabel)
        scrollView.addSubview(recievedAmount)
        
        setUpView()
        
    }

    func setUpView() {
        let member = GlobalVariables.memberTapped
        
        // member name
        memberName.setConstraints(topAnchor: scrollView.topAnchor, view: scrollView, sideLeft: true, height: labelHeight)
        memberName.text = member.name
        
        
        // member tag
        memberTag.setConstraints(topAnchor: memberName.bottomAnchor, view: scrollView, sideLeft: true, height: labelHeight)
        memberTag.setSmall()
        memberTag.text = member.playerTag
        
        // last battle
        lastBattleLabel.setConstraints(topAnchor: memberTag.bottomAnchor, view: scrollView, sideLeft: true, height: labelHeight)
        lastBattleLabel.setSmall()
        lastBattleLabel.text = "Last Battle " + String(member.timeSinceLastBattle!) + " days ago"
        
        // 
        
    }

}
