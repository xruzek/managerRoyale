//
//  ClanViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class ClanViewController: UIViewController {
    
    var labelHeight:CGFloat = 40
    
    var controllerTitle = titleView()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.contentSize = CGSize(width: Constants.screenWidth, height: 2000)
        return v
    }()
    
    let changeClanButton: UIButton = {
        let b = UIButton()
        b.setTitle("^", for: .normal)
        b.setTitleColor(.black, for: .normal)
        return b
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
        controllerTitle.addButton(newButton: changeClanButton)
        
        // Change clan view
        
        
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
        if amount != 0{
            amount /= 60    // in minutes
        }
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


