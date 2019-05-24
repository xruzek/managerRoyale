//
//  ManageViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController, showMemberInfo {
    
    func showMember(member: players) {
        GlobalVariables.memberTapped = member
        memberInfo = memberInfoController()
        self.show(memberInfo, sender: self)
    }
    
    /*var fullClanLabel = rexTitleLabel()
    var inactiveMemberView = manageView()
    var hurtingWarView = manageView()
    var newTopMemberView = topMemberView()*/
    
    //var controllerTitle = titleView()
    var inactiveMembersTitle = RRInfoLabel()
    var hurtingWarTitle = RRInfoLabel()
    var inactiveWarTitle = RRInfoLabel()
   
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        //v.backgroundColor = UIColor.yellow.withAlphaComponent(0.1)
        return v
    }()
    
    var inactiveMembersArr = [players]()
    var inactiveWarMembersArr = [players]()
    var hurtingWar = [players]()
    
    var labelHeight:CGFloat = 30
    
    override func viewWillAppear(_ animated: Bool) {
        //navigationController?.setNavigationBarHidden(true, animated: animated)
        
        
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Manage"
        navigationController!.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.regularFont, size: 20)!]
        
        
        
        // Creates the arrays of needed  members fo this view
        inactiveMembersArr = inactiveMembers(clan: GlobalVariables.activeClan, days: 7)
        inactiveWarMembersArr = inactiveWarMembers(clan: GlobalVariables.activeClan, days: 7)
        hurtingWar = hurtingClanMembers(clan: GlobalVariables.activeClan)
        
        let scrollViewHeight = 3 * Int(GlobalVariables.labelHeight + 15) + inactiveMembersArr.count * Int(GlobalVariables.inactiveMemberView + 15) + hurtingWar.count * Int(GlobalVariables.warViews + 15) + inactiveWarMembersArr.count * Int(GlobalVariables.warViews + 15)
        
        scrollView.contentSize = CGSize(width: Constants.screenWidth, height: CGFloat(scrollViewHeight))
        
        /*
        view.addSubview(controllerTitle)
        controllerTitle.setUp(view: self.view, name: "Manage")
        */
        
        // Scrolling stuff
        view.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        addViews()
        
    }
    
    func addViews() {
        // inactive member title
        scrollView.addSubview(inactiveMembersTitle)
        inactiveMembersTitle.setConstraints(topAnchor: scrollView.topAnchor, view: scrollView, sideLeft: true)
        inactiveMembersTitle.setTitle()
        inactiveMembersTitle.text = "Inactive Members"
        
        // for loop for inactive members
        var priviousAnchor = inactiveMembersTitle.bottomAnchor
        for each in inactiveMembersArr {
            let newView = RRInactiveView()
            scrollView.addSubview(newView)
            newView.setUp(newMember: each, topAnchor: priviousAnchor, view: view)
            priviousAnchor = newView.bottomAnchor
        }
        
        // hurting war Title
        scrollView.addSubview(hurtingWarTitle)
        hurtingWarTitle.setTitle()
        hurtingWarTitle.setConstraints(topAnchor: priviousAnchor, view: scrollView, sideLeft: true)
        hurtingWarTitle.text = "Hurting the Clan War"
        
        // for loop for members hurting the war
        priviousAnchor = hurtingWarTitle.bottomAnchor
        for each in hurtingWar {
            let newView = RRHurtingWarView()
            scrollView.addSubview(newView)
            newView.setUp(newMember: each, topAnchor: priviousAnchor, view: view)
            priviousAnchor = newView.bottomAnchor
            
        }
        
        // Inactive War Member Title
        scrollView.addSubview(inactiveWarTitle)
        inactiveWarTitle.setTitle()
        inactiveWarTitle.setConstraints(topAnchor: priviousAnchor, view: view, sideLeft: true)
        inactiveWarTitle.text = "Inactive War Members"
        
        // for loop for the inactive war members
        priviousAnchor = inactiveWarTitle.bottomAnchor
        for each in inactiveWarMembersArr {
            let newView = RRInactiveWarView()
            scrollView.addSubview(newView)
            newView.setUp(newMember: each, topAnchor: priviousAnchor, view: view)
            priviousAnchor = newView.bottomAnchor
        }
        
        
        
    }
    
}
