//
//  SettingsViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 5/21/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Settings"
        
        addLabels()
        
    }
    
    // adds all the stuff
    func addLabels() {
        let languageLabel = addInfoLine(scrollView: view, view: view, topAnchor: (navigationItem.titleView?.bottomAnchor)!, title: "Language", amount: "NOAMOUNT")
    }
}
