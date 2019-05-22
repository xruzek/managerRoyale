//
//  memberInfoController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 4/6/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class memberInfoController: UIViewController {
    
    var member = players()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        //v.contentSize = CGSize(width: Constants.screenWidth, height: 2500)
        return v
    }()
    
    var labelHeight:CGFloat = 33
    
    var memberInfoLabels = ["War Day Wins", "War Days Played", "War Days Skipped", "Total War Days Involved In", "Win Percentage", "Cards Earned", "Collection Battles Missed"]
    var memberInfoAmount = ["","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollViewHeight = 2 * Int(GlobalVariables.littleLabelHeight) + 15 * Int(GlobalVariables.labelHeight) + 10 * Int(GlobalVariables.memberWarView) + Int(Constants.tabBarHeight)
        
        scrollView.contentSize = CGSize(width: Constants.screenWidth, height: CGFloat(scrollViewHeight))
        
        /*let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        navigationItem.titleView = titleLabel
        titleLabel.text = "Members"
        titleLabel.textAlignment = .left
        titleLabel.textColor = .black*/
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.setNavigationBarHidden(true, animated: animated)
        
        view.backgroundColor = UIColor.white
        
        // refresh Button
        let memberRefreshView = addRefeshView(topAnchor: view.topAnchor, isClan: false, member: member, view: view)
        
        // Scrolling stuff
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: memberRefreshView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        
        // is Hidden true/false for the refresh view
        let today = Date()
        var lastUpdated = today.timeIntervalSince(GlobalVariables.activeClan.lastUpdated!) // in seconds
        lastUpdated /= 60 // in minutes
        
        if lastUpdated > 10 {
            
        } else {
            scrollView.topAnchor.constraint(equalTo: memberRefreshView.bottomAnchor).isActive = false
            memberRefreshView.removeFromSuperview()
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        }
        
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
        
        // member tag and last updated
        let today = Date()
        var amount = today.timeIntervalSince(member.lastUpdated!) // in seconds
        var message = ""
        amount /= 60    // in minutes
        message = member.playerTag + " : Updated " + String(Int(amount)) + " minutes"
        if amount > 60 {
            amount /= 60    // in hours
            message = member.playerTag + " : Updated " + String(Int(amount)) + " hours"
        }
        if amount > 36 {
            amount /= 24    // in days
            message = member.playerTag + " : Updated " + String(Int(amount)) + " days"
        }
        //let memberTag = addInfoLine(scrollView: scrollView, view: view, topAnchor: scrollView.topAnchor, title: message, amount: "NOAMOUNT")
        let memberTag = RRInfoLabel()
        scrollView.addSubview(memberTag)
        memberTag.setSmall()
        memberTag.setConstraints(topAnchor: scrollView.topAnchor, view: scrollView, sideLeft: true)
        memberTag.text = message
        
        // last Battle
        //let lastBattleLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: memberTag.bottomAnchor, title: "Last Battle " + String(member.timeSinceLastBattle!) + " days ago", amount: "NOAMOUNT")
        let lastBattleLabel = RRInfoLabel()
        scrollView.addSubview(lastBattleLabel)
        lastBattleLabel.setSmall()
        lastBattleLabel.setConstraints(topAnchor: memberTag.bottomAnchor, view: scrollView, sideLeft: true)
        lastBattleLabel.text = "Last Battle " + String(member.timeSinceLastBattle!) + " days ago"
        
        // General Info Title
        let generalInfo = addInfoLine(scrollView: scrollView, view: view, topAnchor: lastBattleLabel.bottomAnchor, title: "General Info", amount: "NOAMOUNT")
        generalInfo.setTitle()
        
        // trophies
        let trophyLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: generalInfo.bottomAnchor, title: "Trophies", amount: String(member.trophies))
        
        // Time in clan
        let timeInClan = addInfoLine(scrollView: scrollView, view: view, topAnchor: trophyLabel.bottomAnchor, title: "Time In Clan", amount: String(Int(member.timeInClan!/24)) + " Days")
        
        // donations
        let donationLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: timeInClan.bottomAnchor, title: "Donations", amount: String(member.donations))
        
        // cards Recieved
        let donationsRecievedLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: donationLabel.bottomAnchor, title: "Donations Recived", amount: String(member.donationsReceived))
        
        // Clan Contribution
        let contributionLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: donationsRecievedLabel.bottomAnchor, title: "Clan Contribution", amount: String(Int(round(member.Worth))))
        
        // Past 10 Wars Title
        let pastTenWarStats = addInfoLine(scrollView: scrollView, view: view, topAnchor: contributionLabel.bottomAnchor, title: "Past 10 War Stats", amount: "NOAMOUNT")
        pastTenWarStats.setTitle()
        
        // for loop for all the member info
        var priviousAnchor = pastTenWarStats.bottomAnchor
        var count = 0
        for each in memberInfoAmount {
            let newLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: priviousAnchor, title: memberInfoLabels[count], amount: each)
            priviousAnchor = newLabel.bottomAnchor
            count += 1
        }
        
        // past 10 war days Title
        let pastTenWarsTitle = addInfoLine(scrollView: scrollView, view: view, topAnchor: priviousAnchor, title: "Past Wars In This Clan", amount: "NOAMOUNT")
        pastTenWarsTitle.setTitle()
        
        // for loop for the past war days
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
