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
    
    var clanTagTime = RRInfoLabel()
    var clanInfo = RRInfoLabel()
    var totalTrophies = RRInfoLabel()
    var totalTrophiesAmount = RRInfoLabel()
    var donationLabel = RRInfoLabel()
    var donationAmount = RRInfoLabel()
    var warTrophyLabel = RRInfoLabel()
    var warTrophyAmount = RRInfoLabel()
    
    var warInfo = RRInfoLabel()
    var avgPartisLabel = RRInfoLabel()
    var avgPartisAmount = RRInfoLabel()
    var avgWinsLabel = RRInfoLabel()
    var avgWinsAmount = RRInfoLabel()
    var avgEarnedLabel = RRInfoLabel()
    var avgEarnedAmount = RRInfoLabel()
    
    var topMembers = RRInfoLabel()
    var mostWarDaysLabel = RRInfoLabel()
    var mostWarDaysMember = RRInfoLabel()
    var mostWarDaysAmount = RRInfoLabel()
    var mostEarnedLabel = RRInfoLabel()
    var mostEarnedMember = RRInfoLabel()
    var mostEarnedAmount = RRInfoLabel()
    var mostGenerousLabel = RRInfoLabel()
    var mostGeneroutMember = RRInfoLabel()
    var mostGenerousAmount = RRInfoLabel()
    
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
        
        
        // Scrolling stuff
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: controllerTitle.bottomAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addLabels()
        
        
        
        
    }
    
    func addLabels() {
        // Tag & Last Updated
        scrollView.addSubview(clanTagTime)
        clanTagTime.setSmall()
        clanTagTime.setConstraints(topAnchor: scrollView.topAnchor, view: view, sideLeft: true)
        let today = Date()
        var amount = today.timeIntervalSince(GlobalVariables.activeClan.lastUpdated!) // in seconds
        amount /= 60    // in minutes
        clanTagTime.text = "#" + String(GlobalVariables.activeClan.clanTag) + " Last Updated : " + String(Int(amount)) + " minutes"
        if amount > 60 {
            amount /= 60    // in hours
            clanTagTime.text = "#" + String(GlobalVariables.activeClan.clanTag) + " Last Updated : " + String(Int(amount)) + " hours"
        }
        if amount > 36 {
            amount /= 24    // in days
            clanTagTime.text = "#" + String(GlobalVariables.activeClan.clanTag) + " Last Updated : " + String(Int(amount)) + " days"
        }
        
        
        /**********************
               Clan Info
         **********************/
        // Clan Info Title
        scrollView.addSubview(clanInfo)
        clanInfo.setTitle()
        clanInfo.setConstraints(topAnchor: clanTagTime.bottomAnchor, view: view, sideLeft: true )
        clanInfo.text = "Clan Info"
        
        // Trophy Labels
        scrollView.addSubview(totalTrophies)
        totalTrophies.setConstraints(topAnchor: clanInfo.bottomAnchor, view: view, sideLeft: true )
        totalTrophies.text = "Total Trophies"
        
        scrollView.addSubview(totalTrophiesAmount)
        totalTrophiesAmount.setConstraints(topAnchor: clanInfo.bottomAnchor, view: view, sideLeft: false )
        totalTrophiesAmount.text = String(GlobalVariables.activeClan.totalTrophies)
        
        addLine(leftLabel: totalTrophies, rightLabel: totalTrophiesAmount)
        
        // Donation Labels
        scrollView.addSubview(donationLabel)
        donationLabel.setConstraints(topAnchor: totalTrophies.bottomAnchor, view: view, sideLeft: true )
        donationLabel.text = "Donations/Week"
        
        scrollView.addSubview(donationAmount)
        donationAmount.setConstraints(topAnchor: totalTrophiesAmount.bottomAnchor, view: view, sideLeft: false )
        donationAmount.text = String(GlobalVariables.activeClan.totalDonations)
        
        addLine(leftLabel: donationLabel, rightLabel: donationAmount)
        
        // War Trophy Labels
        scrollView.addSubview(warTrophyLabel)
        warTrophyLabel.setConstraints(topAnchor: donationLabel.bottomAnchor, view: view, sideLeft: true )
        warTrophyLabel.text = "War Trophies"
        
        scrollView.addSubview(warTrophyAmount)
        warTrophyAmount.setConstraints(topAnchor: donationAmount.bottomAnchor, view: view, sideLeft: false )
        warTrophyAmount.text = String(GlobalVariables.activeClan.clanWarTrophies)
        
        addLine(leftLabel: warTrophyLabel, rightLabel: warTrophyAmount)
        
        /**********************
               War Info
         **********************/
        
        // War Info Title
        scrollView.addSubview(warInfo)
        warInfo.setTitle()
        warInfo.setConstraints(topAnchor: warTrophyLabel.bottomAnchor, view: view, sideLeft: true )
        warInfo.text = "War Stats"
        
        // Average Participation
        scrollView.addSubview(avgPartisLabel)
        avgPartisLabel.setConstraints(topAnchor: warInfo.bottomAnchor, view: view, sideLeft: true )
        avgPartisLabel.text = "Avgerage Participation"
        
        scrollView.addSubview(avgPartisAmount)
        avgPartisAmount.setConstraints(topAnchor: warInfo.bottomAnchor, view: view, sideLeft: false )
        avgPartisAmount.text = String(GlobalVariables.activeClan.totalWarDaysInvolvedIn/10)
        
        addLine(leftLabel: avgPartisLabel, rightLabel: avgPartisAmount)
        
        // Average Wins
        scrollView.addSubview(avgWinsLabel)
        avgWinsLabel.setConstraints(topAnchor: avgPartisLabel.bottomAnchor, view: view, sideLeft: true )
        avgWinsLabel.text = "Average Wins"
        
        scrollView.addSubview(avgWinsAmount)
        avgWinsAmount.setConstraints(topAnchor: avgPartisLabel.bottomAnchor, view: view, sideLeft: false )
        avgWinsAmount.text = String(GlobalVariables.activeClan.totalWarDayWins/10)
        
        addLine(leftLabel: avgWinsLabel, rightLabel: avgWinsAmount)
        
        // Average Cards Earned
        scrollView.addSubview(avgEarnedLabel)
        avgEarnedLabel.setConstraints(topAnchor: avgWinsLabel.bottomAnchor, view: view, sideLeft: true )
        avgEarnedLabel.text = "Average Cards Earned"
        
        scrollView.addSubview(avgEarnedAmount)
        avgEarnedAmount.setConstraints(topAnchor: avgWinsAmount.bottomAnchor, view: view, sideLeft: false )
        avgEarnedAmount.text = String(GlobalVariables.activeClan.totalCardsCollected/10)
        
        addLine(leftLabel: avgEarnedLabel, rightLabel: avgEarnedAmount)
        
        /**********************
              Top Members
         **********************/
        scrollView.addSubview(topMembers)
        topMembers.setTitle()
        topMembers.setConstraints(topAnchor: avgEarnedLabel.bottomAnchor, view: view, sideLeft: true )
        topMembers.text = "Top Members"
        
        // Most War Days Won
        GlobalVariables.activeClan.sortArray(sortType: "War Days Won")
        scrollView.addSubview(mostWarDaysLabel)
        mostWarDaysLabel.setConstraints(topAnchor: topMembers.bottomAnchor, view: view, sideLeft: true )
        mostWarDaysLabel.setMedium()
        mostWarDaysLabel.text = "Most War Days Won"
        
        scrollView.addSubview(mostWarDaysMember)
        mostWarDaysMember.setConstraints(topAnchor: mostWarDaysLabel.bottomAnchor, view: view, sideLeft: true )
        mostWarDaysMember.text = GlobalVariables.activeClan.playerArray[0].name
        
        scrollView.addSubview(mostWarDaysAmount)
        mostWarDaysAmount.setConstraints(topAnchor: mostWarDaysLabel.bottomAnchor, view: view, sideLeft: false )
        mostWarDaysAmount.text = String(GlobalVariables.activeClan.playerArray[0].warDaysWon)
        
        addLine(leftLabel: mostWarDaysMember, rightLabel: mostWarDaysAmount)
        
        // Most Cards Collected
        GlobalVariables.activeClan.sortArray(sortType: "Cards Collected")
        scrollView.addSubview(mostEarnedLabel)
        mostEarnedLabel.setMedium()
        mostEarnedLabel.setConstraints(topAnchor: mostWarDaysMember.bottomAnchor, view: view, sideLeft: true)
        mostEarnedLabel.text = "Most Cards Collected"
        
        scrollView.addSubview(mostEarnedMember)
        mostEarnedMember.setConstraints(topAnchor: mostEarnedLabel.bottomAnchor, view: view, sideLeft: true)
        mostEarnedMember.text = GlobalVariables.activeClan.playerArray[0].name
        
        scrollView.addSubview(mostEarnedAmount)
        mostEarnedAmount.setConstraints(topAnchor: mostEarnedLabel.bottomAnchor, view: view, sideLeft: false)
        mostEarnedAmount.text = String(GlobalVariables.activeClan.playerArray[0].cardsEarned)
        
        addLine(leftLabel: mostEarnedMember, rightLabel: mostEarnedAmount)
        
        // Most Generous
        GlobalVariables.activeClan.sortArray(sortType: "Most Generous")
        scrollView.addSubview(mostGenerousLabel)
        mostGenerousLabel.setConstraints(topAnchor: mostEarnedMember.bottomAnchor, view: view, sideLeft: true)
        mostGenerousLabel.setMedium()
        mostGenerousLabel.text = "Most Generous"
        
        scrollView.addSubview(mostGeneroutMember)
        mostGeneroutMember.setConstraints(topAnchor: mostGenerousLabel.bottomAnchor, view: view, sideLeft: true)
        mostGeneroutMember.text = GlobalVariables.activeClan.playerArray[0].name
        
        scrollView.addSubview(mostGenerousAmount)
        mostGenerousAmount.setConstraints(topAnchor: mostGenerousLabel.bottomAnchor, view: view, sideLeft: false)
        mostGenerousAmount.text = String(GlobalVariables.activeClan.playerArray[0].donations)
        
        addLine(leftLabel: mostGeneroutMember, rightLabel: mostGenerousAmount)
        
        
    }
    
    func addLine(leftLabel: RRInfoLabel, rightLabel: RRInfoLabel) {
        let line = RRLabelLine()
        scrollView.addSubview(line)
        line.setUp(leftAnchor: leftLabel.rightAnchor, rightAnchor: rightLabel.leftAnchor, centerAnchor: leftLabel.centerYAnchor)
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
