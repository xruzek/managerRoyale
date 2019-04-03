//
//  ManageViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class ManageViewController: UIViewController {
    var fullClanLabel = rexTitleLabel()
    var inactiveMemberView = manageView()
    var hurtingWarView = manageView()
    var newTopMemberView = topMemberView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Manage"
        
        view.addSubview(fullClanLabel)
        fullClanLabel.setUp(view: self.view, name: " Full Clan?")
        fullClanLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 87).isActive = true
        fullClanLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(inactiveMemberView)
        inactiveMemberView.setUpInactive(view: self.view, fullLabel: fullClanLabel)
        
        view.addSubview(hurtingWarView)
        hurtingWarView.setUpHurting(view: self.view, fullLabel: fullClanLabel)
        
        view.addSubview(newTopMemberView)
        newTopMemberView.setUp(view: self.view, topView: hurtingWarView)
    }
}
