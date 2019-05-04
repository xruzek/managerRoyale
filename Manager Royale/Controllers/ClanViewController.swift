//
//  ClanViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class ClanViewController: UIViewController {
    /*
    var clanStatsView = ClanStatsView()
    
    var activeClanView = UIView()
    var myClansView = clanListView()
    
    var activeClan = UILabel()
    var clanName = UILabel()
    var clanTag = UILabel()
    var addClan = UIButton()
    var addClanField = clanTagTextField()
    */
    var labelHeight:CGFloat = 40
    
    var controllerTitle = titleView()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.contentSize = CGSize(width: Constants.screenWidth, height: 2000)
        return v
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        //navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.title = GlobalVariables.activeClan.clanName
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        Constants.tabBarHeight = (tabBarController?.tabBar.frame.size.height)!
        //print((tabBarController?.tabBar.frame.size.height)!)
        
        // clan name
        view.addSubview(controllerTitle)
        controllerTitle.setUp(view: self.view, name: GlobalVariables.activeClan.clanName)
        
        // refresh view
        let newRefreshView = addRefeshView(topAnchor: controllerTitle.bottomAnchor, isClan: true, view: view)
        
        // Scrolling stuff
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: newRefreshView.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addLabels()
        
        // is Hidden true/false for the refresh view
        let today = Date()
        var amount = today.timeIntervalSince(GlobalVariables.activeClan.lastUpdated!) // in seconds
        amount /= 60 // in minuts
        
        if amount > 10 {
            
        } else {
            scrollView.topAnchor.constraint(equalTo: newRefreshView.bottomAnchor).isActive = false
            newRefreshView.removeFromSuperview()
            scrollView.topAnchor.constraint(equalTo: controllerTitle.bottomAnchor).isActive = true
        }
    }
    
    func addLabels() {
        let clan = GlobalVariables.activeClan
        
        let today = Date()
        var amount = today.timeIntervalSince(GlobalVariables.activeClan.lastUpdated!) // in seconds
        amount /= 60    // in minutes
        var message = ""
        message = "#" + String(clan.clanTag) + " Last Updated : " + String(Int(amount)) + " minutes"
        if amount > 60 {
            amount /= 60    // in hours
            message = "#" + String(clan.clanTag) + " Last Updated : " + String(Int(amount)) + " hours"
        }
        if amount > 36 {
            amount /= 24    // in days
            message = "#" + String(clan.clanTag) + " Last Updated : " + String(Int(amount)) + " days"
        }
        
        // tag & Last Updated
        let clanTagTime = addInfoLine(scrollView: scrollView, view: view, topAnchor: scrollView.topAnchor, title: message, amount: "NOAMOUNT")
        clanTagTime.setSmall()
        
        /**********************
               Clan Info
         **********************/
        // Clan Info Title
        let clanInfoTitle = addInfoLine(scrollView: scrollView, view: view, topAnchor: clanTagTime.bottomAnchor, title: "Clan Info", amount: "NOAMOUNT")
        clanInfoTitle.setTitle()
        
        // Trophy Labels
        let trophyLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: clanInfoTitle.bottomAnchor, title: "Total Trophies", amount: String(clan.totalTrophies))
        
        // Donation Labels
        let donationLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: trophyLabel.bottomAnchor, title: "Donations/Week", amount: String(clan.totalDonations))
        
        
        // War Trophy Labels
        let warTrophyLabel = addInfoLine(scrollView: scrollView, view: view, topAnchor: donationLabel.bottomAnchor, title: "War Trophies", amount: String(clan.clanWarTrophies))
        
        /**********************
               War Info
         **********************/
        
        // War Info Title
        let warInfo = addInfoLine(scrollView: scrollView, view: view, topAnchor: warTrophyLabel.bottomAnchor, title: "War Stats", amount: "NOAMOUNT")
        warInfo.setTitle()
        
        // Average Participation
        let averageParticipation = addInfoLine(scrollView: scrollView, view: view, topAnchor: warInfo.bottomAnchor, title: "Average Participation", amount: String(clan.totalWarDaysInvolvedIn/10))
        
        // Average Wins
        let averageWins = addInfoLine(scrollView: scrollView, view: view, topAnchor: averageParticipation.bottomAnchor, title: "Average Wins", amount: String(clan.totalWarDayWins/10))
        
        // Average Cards Earned
        let averageCardsEarned = addInfoLine(scrollView: scrollView, view: view, topAnchor: averageWins.bottomAnchor, title: "Average Cards Earned", amount: String(clan.totalCardsCollected/10))
        
        /**********************
              Top Members
         **********************/
        let topMembersTitle = addInfoLine(scrollView: scrollView, view: view, topAnchor: averageCardsEarned.bottomAnchor, title: "Top Members", amount: "NOAMOUNT")
        topMembersTitle.setTitle()
        
        // Most War Days Won
        clan.sortArray(sortType: "War Days Won")
        let mostWarDaysWonTitle = addInfoLine(scrollView: scrollView, view: view, topAnchor: topMembersTitle.bottomAnchor, title: "War Days Won", amount: "NOAMOUNT")
        mostWarDaysWonTitle.setMedium()
        
        let mostWarDaysWonMember = addInfoLine(scrollView: scrollView, view: view, topAnchor: mostWarDaysWonTitle.bottomAnchor, title: clan.playerArray[0].name, amount: String(clan.playerArray[0].warDaysWon))
        
        // Most Cards Collected
        clan.sortArray(sortType: "Cards Collected")
        let mostCardsCollectedTitle = addInfoLine(scrollView: scrollView, view: view, topAnchor: mostWarDaysWonMember.bottomAnchor, title: "Most Cards Earned", amount: "NOAMOUNT")
        mostCardsCollectedTitle.setMedium()
        
        let mostCardsCollectedMember = addInfoLine(scrollView: scrollView, view: view, topAnchor: mostCardsCollectedTitle.bottomAnchor, title: clan.playerArray[0].name, amount: String(clan.playerArray[0].cardsEarned))
        
        // Most Generous
        clan.sortArray(sortType: "Most Generous")
        let mostGenerourTitle = addInfoLine(scrollView: scrollView, view: view, topAnchor: mostCardsCollectedMember.bottomAnchor, title: "Most Generour", amount: "NOAMOUNT")
        mostGenerourTitle.setMedium()
        
        let mostGenerousMember = addInfoLine(scrollView: scrollView, view: view, topAnchor: mostGenerourTitle.bottomAnchor, title: clan.playerArray[0].name, amount: String(clan.playerArray[0].donations))
        
        // Most Trophies
        clan.sortArray(sortType: "Trophies")
        let mostTrophiesTitle = addInfoLine(scrollView: scrollView, view: view, topAnchor: mostGenerousMember.bottomAnchor, title: "Most Trophies", amount: "NOAMOUNT")
        mostTrophiesTitle.setMedium()
        
        let mostTrophiesMember = addInfoLine(scrollView: scrollView, view: view, topAnchor: mostTrophiesTitle.bottomAnchor, title: clan.playerArray[0].name, amount: String(clan.playerArray[0].trophies))
        
    }

}


/*
 scrollView.addSubview(activeClan)
 activeClan.translatesAutoresizingMaskIntoConstraints = false
 activeClan.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16.0).isActive = true
 activeClan.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 16.0).isActive = true
 activeClan.text = "Hello"
 
 scrollView.addSubview(clanName)
 clanName.translatesAutoresizingMaskIntoConstraints = false
 clanName.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 400.0).isActive = true
 clanName.text = "World"
 // constrain labelTwo at 1000-pts from the top
 clanName.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 1500).isActive = true
 // constrain labelTwo to right & bottom with 16-pts padding
 clanName.leftAnchor.constraint(equalTo: scrollView.leftAnchor).isActive = true
 clanName.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16.0).isActive = true
 
 
 // old View controller stuff
 
 activeClanView.addSubview(activeClan)
 activeClanView.addSubview(clanName)
 activeClanView.addSubview(clanTag)
 activeClanView.addSubview(addClan)
 activeClanView.addSubview(addClanField)
 
 view.addSubview(controllerTitle)
 controllerTitle.setUp(view: self.view, name: GlobalVariables.activeClan.clanName)
 
 view.addSubview(clanStatsView)
 clanStatsView.setUp(view: self.view, title: controllerTitle)
 
 view.addSubview(activeClanView)
 setUpActiveClanView()
 
 view.addSubview(myClansView)
 setUpClanList()
 
 setUpActiveClanObjects(view: activeClanView)
 */

/*
 func setUpClanList() {
 myClansView.backgroundColor = UIColor.blue.withAlphaComponent(0.4)
 myClansView.translatesAutoresizingMaskIntoConstraints = false
 
 myClansView.topAnchor.constraint(equalTo: clanStatsView.bottomAnchor).isActive = true
 myClansView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
 myClansView.rightAnchor.constraint(equalTo: activeClanView.leftAnchor).isActive = true
 myClansView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -Constants.tabBarHeight).isActive = true
 
 
 
 }
 
 
 func setUpActiveClanView() {
 activeClanView.backgroundColor = UIColor.red.withAlphaComponent(0.4)
 
 activeClanView.translatesAutoresizingMaskIntoConstraints = false
 activeClanView.topAnchor.constraint(equalTo: clanStatsView.bottomAnchor).isActive = true
 activeClanView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
 activeClanView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width/1.7).isActive = true
 activeClanView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -Constants.tabBarHeight).isActive = true
 
 
 }
 
 func setUpActiveClanObjects(view: UIView) {
 var heightConstant: CGFloat = 30
 // Adds values to objects
 activeClan.text = "ActiveClan"
 activeClan.backgroundColor = .white
 
 clanName.text = GlobalVariables.activeClan.clanName
 clanTag.text = "Clan Tag: " + GlobalVariables.activeClan.clanTag
 addClan.setTitle("Add Clan", for: .normal)
 addClan.backgroundColor = .blue
 
 // constraints
 activeClan.translatesAutoresizingMaskIntoConstraints = false
 activeClan.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
 activeClan.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
 activeClan.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
 activeClan.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
 
 clanName.translatesAutoresizingMaskIntoConstraints = false
 clanName.topAnchor.constraint(equalTo: activeClan.bottomAnchor).isActive = true
 clanName.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
 clanName.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
 clanName.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
 
 clanTag.translatesAutoresizingMaskIntoConstraints = false
 clanTag.topAnchor.constraint(equalTo: clanName.bottomAnchor).isActive = true
 clanTag.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
 clanTag.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
 clanTag.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
 
 addClan.translatesAutoresizingMaskIntoConstraints = false
 addClan.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
 addClan.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
 addClan.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
 addClan.heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
 addClanField.setUp(view: activeClanView, adjacentLabel: addClan)
 
 
 addClan.addTarget(self, action: #selector(addClanTarget), for: .touchUpInside)
 
 }
 
 
 @objc func addClanTarget() {
 addClanField.text = "9GCQYY0C"
 if addClanField.text! == "" {
 print("Must enter clan Tag in the Text Field")
 
 }else {
 addNewClan(withLocation: addClanField.text!) { (completionMessage: String) in
 print(completionMessage)
 if completionMessage == "worked" {
 DispatchQueue.main.async {
 self.myClansView.addClan(tag: self.addClanField.text!)
 
 //self.myActInd.stopAnimating()
 }
 }else {
 DispatchQueue.main.async {
 //self.displayErrorMessage(error: completionMessage)
 }
 }
 }
 }
 }
 */
