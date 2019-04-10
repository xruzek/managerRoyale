//
//  Clan.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/29/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit


let memberViewDelegate = MembersViewController()

class TabViewController: UITabBarController {
    
    override func viewWillAppear(_ animated: Bool) {
        setUpTabController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    func setUpTabController() {
        let tabFont = UIFont(name: Fonts.avenirNextMedium, size: 15)!
        
        
        
        let clanView = UINavigationController(rootViewController: ClanViewController())
        //clanView.tabBarItem.image = UIImage(named: "clan_icon")
        //clanView.tabBarItem.selectedImage = the selected image
        clanView.tabBarItem.title = "Clan"
        clanView.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        clanView.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: tabFont], for: .normal)
        
        
        let memberView = UINavigationController(rootViewController: memberViewDelegate)
        //memberView.tabBarItem.image = UIImage(named: "member_icon")
        //memberView.tabBarItem.selectedImage = the selected image
        memberView.tabBarItem.title = "Members"
        memberView.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        memberView.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: tabFont], for: .normal)
        
        
        let manageView = UINavigationController(rootViewController: ManageViewController())
        //manageView.tabBarItem.image = UIImage(named: "member_icon")
        //manageView.tabBarItem.selectedImage = the selected image
        manageView.tabBarItem.title = "Manage"
        manageView.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        manageView.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: tabFont], for: .normal)
        
        tabBar.barTintColor = UIColor.lightGray
        // need an image to chnage how it looks when selected
        
        viewControllers = [clanView, memberView, manageView]
        
        
    }
}
