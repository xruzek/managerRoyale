//
//  ManageViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController {
    /*var fullClanLabel = rexTitleLabel()
    var inactiveMemberView = manageView()
    var hurtingWarView = manageView()
    var newTopMemberView = topMemberView()*/
    
    var controllerTitle = titleView()
    
    
    
    var inactiveMembersArr = [players]()
    var inactiveWarMembersArr = [players]()
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
        inactiveMembersArr = inactiveMembers(clan: GlobalVariables.activeClan, days: 7)
        
        inactiveWarMembersArr = inactiveWarMembers(clan: GlobalVariables.activeClan, days: 2)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //navigationController?.navigationBar.prefersLargeTitles = true
        //navigationItem.title = "Manage"
        
        
        
        
        
        
        
        view.addSubview(controllerTitle)
        controllerTitle.setUp(view: self.view, name: "Manage")
        
        /*view.addSubview(fullClanLabel)
        fullClanLabel.setUp(view: self.view, name: " Full Clan?")
        fullClanLabel.topAnchor.constraint(equalTo: controllerTitle.bottomAnchor).isActive = true
        fullClanLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(inactiveMemberView)
        inactiveMemberView.setUpInactive(view: self.view, fullLabel: fullClanLabel)
        
        view.addSubview(hurtingWarView)
        hurtingWarView.setUpHurting(view: self.view, fullLabel: fullClanLabel)
        
        view.addSubview(newTopMemberView)
        newTopMemberView.setUp(view: self.view, topView: hurtingWarView)*/
    }
}
