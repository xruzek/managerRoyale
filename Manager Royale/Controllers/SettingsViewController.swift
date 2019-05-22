//
//  SettingsViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 5/21/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    var clanTagTF = clanTagTextField()
    var changeButton = SaveClanButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = .white
        navigationItem.title = "Settings"
        
        addLabels()
    }
    
    // adds all the stuff
    func addLabels() {
        var langLabel = UILabel()
        view.addSubview(langLabel)
        langLabel.sizeToFit()
        langLabel.font = UIFont(name: Fonts.lighterFont, size: GlobalVariables.labelFontSize)
        langLabel.translatesAutoresizingMaskIntoConstraints = false
        langLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 84).isActive = true
        langLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        langLabel.heightAnchor.constraint(equalToConstant: GlobalVariables.labelHeight).isActive = true
        langLabel.text = "Language"
        
        let changeLabel = addInfoLine(scrollView: view, view: view, topAnchor: langLabel.bottomAnchor, title: "Change Clan: ", amount: "NOAMOUNT")
        
        view.addSubview(clanTagTF)
        clanTagTF.setUp(view: view, label: changeLabel)
        
        view.addSubview(changeButton)
        changeButton.setUp(view: view, textField: clanTagTF)
        changeButton.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        changeButton.addTarget(self, action: #selector(changeClan), for: .touchUpInside)
        
        //let tagLabel = addInfoLine(scrollView: view, view: view, topAnchor: changeLabel.bottomAnchor, title: "Tag ", amount: "NOAMOUNT")
    }
    
    
    @objc func changeClan() {
        //The Change Clan Function
        //clanTagTF.text = "9GCQYY0C"
        
        if clanTagTF.text! == "" {
            print("Must enter clan Tag in the Text Field")
         
        }else {
            let newTag: String = clanTagTF.text!.replacingOccurrences(of: "#", with: "")
            
            addNewClan(withLocation: newTag) { (completionMessage: String) in
                print(completionMessage)
                if completionMessage == "worked" {
                    DispatchQueue.main.async {
                        GlobalVariables.activeClan = loadClan(activeClan: newTag)
                        
                        mainScreen.viewDidLoad()
                        mainScreen.viewWillAppear(true)
                    }
                    
                }else {
                    DispatchQueue.main.async {
                        //self.displayErrorMessage(error: completionMessage)  (Coulden't find tag)
                        
                    }
                }
                
            }
        }
        
        
    }
}
