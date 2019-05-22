//
//  InitialClanViewViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/29/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit
// clanTag = "9GCQYY0C"


class InitialClanViewController: UIViewController {
    var titleLabel = InitialViewTitleLabel()
    var saveButton = SaveClanButton()
    var tutorialView = tutorialForClanTagView()
    var clanTagTF = clanTagTextField()
    var resetButton = SaveClanButton()
    var nextButton = SaveClanButton()
    
    let myActInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    
    override func viewWillAppear(_ animated: Bool) {
        
        // User's first time
        GlobalVariables.activeClan = loadClan(activeClan: "9GCQYY0C")
   
        //GlobalVariables.activeClan.displayTimeSincePlayed()
        
        //GlobalVariables.activeClan.displayTimeSincePlayed()
        
        //myAPIClanGrab(withLocation: "9GCQYY0C") { (didWork: String) in
          //  print("didWork: ", didWork)
        //}
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.title = "Enter Your Clan Tag Here"
       
        view.addSubview(myActInd)
        //myActInd.hidesWhenStopped = false
        myActInd.center = view.center
        
        view.addSubview(titleLabel)
        titleLabel.setUp(view: self.view)
        
        view.addSubview(clanTagTF)
        clanTagTF.setUp(view: self.view, label: titleLabel)
        
        view.addSubview(saveButton)
        saveButton.setUp(view: self.view, textField: clanTagTF)
        saveButton.addTarget(self, action: #selector(saveClan), for: .touchUpInside)
        
        view.addSubview(resetButton)
        resetButton.setUp(view: self.view, saveButton: saveButton)
        resetButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        resetButton.setTitle("Reset", for: .normal)
        
        view.addSubview(nextButton)
        nextButton.setUp(view: self.view, saveButton: resetButton)
        nextButton.addTarget(self, action: #selector(nextView), for: .touchUpInside)
        nextButton.setTitle("Next", for: .normal)
    
        //deleteClan(clanTag: "9GCQYY0C")
        //dump(Array(UserDefaults.standard.dictionaryRepresentation().keys))
    }
    
    @objc func nextView() {
        presentNextView()
    }
    
    @objc func reset () {
        deleteClan(clanTag: "9GCQYY0C")
        print("Reset the clan: 9GCQYY0C")
    }
    
    @objc func saveClan() {
        //The Add clan Function
        myActInd.startAnimating()

        clanTagTF.text = "9GCQYY0C"
        if clanTagTF.text! == "" {
            print("Must enter clan Tag in the Text Field")
            
        }else {
            addNewClan(withLocation: clanTagTF.text!) { (completionMessage: String) in
                print(completionMessage)
                if completionMessage == "worked" {
                    DispatchQueue.main.async {
                        GlobalVariables.activeClan = loadClan(activeClan: "9GCQYY0C")
                        self.myActInd.stopAnimating()
                        print("Updated")
                        mainScreen = TabViewController()
                        firstScreen.show(mainScreen, sender: self)
                    }
                    
                }else {
                    DispatchQueue.main.async {
                        self.displayErrorMessage(error: completionMessage)
                    }
                }
            }
        }
    }
    
    // displays the certain error messages based on the error
    func displayErrorMessage(error: String) {
        if error == "wrongTag" {
            
        } else if error == "serverDown" {
            
            
        } else {
            
            
        }
    }
    
}




/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
