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
    var trophies = RRInfoLabel()
    var memberTag = RRInfoLabel()
    var lastBattleLabel = RRInfoLabel()
    var memberStatus = RRInfoLabel()
    var pastTenWarStats = RRInfoLabel()
    
    var donationLabel = RRInfoLabel()
    var donationAmount = RRInfoLabel()
    var recievedLabel = RRInfoLabel()
    var recievedAmount = RRInfoLabel()
    
    var pastTenWarsTitle = RRInfoLabel()
    
    var member = players()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.contentSize = CGSize(width: Constants.screenWidth, height: 2500)
        return v
    }()
    
    var labelHeight:CGFloat = 33
    
    var memberInfoLabels = ["Wins", "Played", "Skipped", "Total Involved In", "Win Percentage", "Cards Earned", "Collection Battles Missed"]
    var memberInfoAmount = ["","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Members"
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black*/
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        scrollView.addSubview(trophies)
        scrollView.addSubview(lastBattleLabel)
        scrollView.addSubview(memberStatus)
        scrollView.addSubview(pastTenWarStats)
        
        scrollView.addSubview(donationLabel)
        scrollView.addSubview(donationAmount)
        scrollView.addSubview(recievedLabel)
        scrollView.addSubview(recievedAmount)
        
        scrollView.addSubview(pastTenWarsTitle)
        
        setUpView()
        
    }

    func setUpView() {
        member = GlobalVariables.memberTapped
        navigationItem.title = member.name
        
        memberInfoAmount[0] = String(member.warDaysWon)
        memberInfoAmount[1] = String(member.warDaysPlayed)
        memberInfoAmount[2] = String(member.warDaysNotPlayed)
        memberInfoAmount[3] = String(member.warDaysInvolvedIn)
        memberInfoAmount[4] = String(Int(member.winPercent!)) + "%"
        memberInfoAmount[5] = String(member.cardsEarned)
        memberInfoAmount[6] = String(member.collectionBattelsMissed)
        
        // member name
        memberName.setConstraints(topAnchor: scrollView.topAnchor, view: scrollView, sideLeft: true )
        memberName.text = member.name
        
        // member tag
        memberTag.setSmall()
        memberTag.setConstraints(topAnchor: memberName.bottomAnchor, view: scrollView, sideLeft: true )
        
        // trophies
        trophies.setConstraints(topAnchor: scrollView.topAnchor, view: view, sideLeft: false)
        trophies.text = String(member.trophies)
        
        globalAddLine(leftLabel: memberName, rightLabel: trophies, view: scrollView)
        
        let today = Date()
        var amount = today.timeIntervalSince(member.lastUpdated!) // in seconds
        amount /= 60    // in minutes
        memberTag.text = member.playerTag + " : Updated " + String(Int(amount)) + " minutes"
        if amount > 60 {
            amount /= 60    // in hours
            memberTag.text = member.playerTag + " : Updated " + String(Int(amount)) + " hours"
        }
        if amount > 36 {
            amount /= 24    // in days
            memberTag.text = member.playerTag + " : Updated " + String(Int(amount)) + " days"
        }
        
        
        // last battle
        lastBattleLabel.setSmall()
        lastBattleLabel.setConstraints(topAnchor: memberTag.bottomAnchor, view: scrollView, sideLeft: true )
        lastBattleLabel.text = "Last Battle " + String(member.timeSinceLastBattle!) + " days ago"
        
        // status
        memberStatus.setConstraints(topAnchor: lastBattleLabel.bottomAnchor, view: scrollView, sideLeft: true )
        memberStatus.text = "Status"
        
        // Past 10 Wars title
        pastTenWarStats.setTitle()
        pastTenWarStats.setConstraints(topAnchor: memberStatus.bottomAnchor, view: scrollView, sideLeft: true )
        pastTenWarStats.text = "Past 10 War Stats"
        
        // for loop for all the member info
        var priviousAnchor = pastTenWarStats.bottomAnchor
        var count = 0
        for each in memberInfoAmount {
            let newLabel = RRInfoLabel()
            scrollView.addSubview(newLabel)
            newLabel.setConstraints(topAnchor: priviousAnchor, view: scrollView, sideLeft: true )
            newLabel.text = memberInfoLabels[count]
            
            let amountLabel = RRInfoLabel()
            scrollView.addSubview(amountLabel)
            amountLabel.setConstraints(topAnchor: priviousAnchor, view: view, sideLeft: false )
            amountLabel.text = each
            priviousAnchor = newLabel.bottomAnchor
            count += 1
            
            globalAddLine(leftLabel: newLabel, rightLabel: amountLabel, view: scrollView)
            
        }
        
        // Donations
        donationLabel.setConstraints(topAnchor: priviousAnchor, view: scrollView, sideLeft: true )
        donationLabel.text = "Donations"
        
        donationAmount.setConstraints(topAnchor: priviousAnchor, view: view, sideLeft: false )
        donationAmount.text = String(member.donations)
        
        globalAddLine(leftLabel: donationLabel, rightLabel: donationAmount, view: scrollView)
        
        //donations recieved
        recievedLabel.setConstraints(topAnchor: donationLabel.bottomAnchor, view: scrollView, sideLeft: true )
        recievedLabel.text = "Donations Recieved"
        
        recievedAmount.setConstraints(topAnchor: donationLabel.bottomAnchor, view: view, sideLeft: false )
        recievedAmount.text = String(member.donationsReceived)
        
        globalAddLine(leftLabel: recievedLabel, rightLabel: recievedAmount, view: scrollView)
        
        // past 10 war days Title
        pastTenWarsTitle.setTitle()
        pastTenWarsTitle.setConstraints(topAnchor: recievedLabel.bottomAnchor, view: scrollView, sideLeft: true )
        pastTenWarsTitle.text = "Past Wars In This Clan"
        
        // for loop for the past war days
        let t = RRWarView()
        
        priviousAnchor = pastTenWarsTitle.bottomAnchor
        count = 1
        for war in member.warDayArray.reversed() {
            let newView = RRWarView()
            scrollView.addSubview(newView)
            newView.setUp(index: count, war: war, topAnchor: priviousAnchor, view: view)
            priviousAnchor = newView.bottomAnchor
            count += 1
        }
        
    }

}
