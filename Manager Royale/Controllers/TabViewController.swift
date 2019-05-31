//
//  Clan.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/29/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit


let memberViewDelegate = MembersViewController()
let manageViewDelegate = ManageViewController()

class TabViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        setUpTabController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
    }
    
    // Deselects member when moved to different tab
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        memberInfo.navigationController?.popViewController(animated: false)
        //settingsController.navigationController?.popViewController(animated: false)
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //print(item.title)
    }
    
    func setUpTabController() {
        let tabFont = UIFont(name: Fonts.avenirNextMedium, size: 15)!

        
        let clanView = UINavigationController(rootViewController: ClanViewController())
        //clanView.tabBarItem.image = UIImage(named: "clan_icon")
        //clanView.tabBarItem.selectedImage = the selected image
        clanView.tabBarItem.title = "Clan"
        clanView.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        clanView.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: tabFont], for: .normal)
        
        
        let memberView = UINavigationController(rootViewController: memberViewDelegate)
        //memberView.tabBarItem.image = UIImage(named: "member_icon")
        //memberView.tabBarItem.selectedImage = the selected image
        memberView.tabBarItem.title = "Members"
        memberView.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        memberView.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: tabFont], for: .normal)
        
        
        let manageView = UINavigationController(rootViewController: manageViewDelegate)
        //manageView.tabBarItem.image = UIImage(named: "member_icon")
        //manageView.tabBarItem.selectedImage = the selected image
        manageView.tabBarItem.title = "Manage"
        manageView.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
        manageView.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: tabFont], for: .normal)
        
        tabBar.barTintColor = UIColor.black
        // need an image to chnage how it looks when selected
        
        viewControllers = [clanView, memberView, manageView]
        
        
    }
}
