//
//  ViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 1/17/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit


class ViewController: UIViewController/*, UITextFieldDelegate*/ {
    // clanTag = "9GCQYY0C"
    // Contains the text the user entered  for the clan tag
    @IBOutlet weak var clanTagTextField: UITextField!
    
    // Trys to save the clan, returns messages if: wrong tag, already have tag saved, server down
    @IBAction func saveButton(_ sender: Any) {
        
        if !alreadyHaveClan(Tag: clanTagTextField.text!) {
            myAPIWarlogGrab(withLocation: clanTagTextField.text!) { (didWorkAswell: String) in
            }
            myAPIClanGrab(withLocation: clanTagTextField.text!) { (didWork: String) in
                // somthing aint right
                DispatchQueue.main.async {
                    self.errorHandel(didWork: didWork)
                }
            }
        }else {
            self.errorView.isHidden = false
            self.errorLabel.text = "Already have that clan saved"
            // highlight clan saved in the list
        }
    }
    
    // checks to see if the clan already exists in the clanTag array of clans
    func alreadyHaveClan(Tag:String) -> Bool {
        // for each loop, if found one, set that one to active, display message, and return true
        if let clansArray = UserDefaults.standard.array(forKey: "myClans") as? [[String: Any]] {
            for clan in clansArray {
                if clan["tag"] as! String == Tag {
                    return true
                }
            }
            return false
        }else {
            return false
        }
        
        
    }
    
    // Error Handeling
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var errorAddedLabel: UILabel!
    @IBOutlet weak var errorView: UIView!
    @IBAction func errorButton(_ sender: Any) {
        errorView.isHidden = true
    }
    func errorHandel(didWork:String) {
        print("didWork = ", didWork)
        if didWork == "worked" {
            // Everything worked fine
            self.errorView.isHidden = true
            self.errorAddedLabel.isHidden = false
            // call function to update the myClans & active clan views
            
        }else if didWork == "wrongKey" {
            // somthing aint right with the API key
        }else if didWork == "wrongTag" {
            // they entered in the wrong tag
            self.errorView.isHidden = false
            self.errorLabel.text = "Wrong Clan tag"
        }else if didWork == "serverDown" {
            // the server done went down
            self.errorView.isHidden = false
            self.errorLabel.text = "Server is down"
        }else if didWork == "local" {
            self.errorView.isHidden = false
            self.errorLabel.text = "Must Enter Somthing"
        }
    }
    
    // Loads in the clan array of all the clans they have
    override func viewWillAppear(_ animated: Bool) {
        
         if let activeClan = UserDefaults.standard.object(forKey: "activeClan") as? String{
             // found a clan to display
             var newClan = theClan()
             newClan = loadClan(activeClan: activeClan)
             newClan.sortArray(sortType: "byWorth")
             // display active clan in active clans
            
             // display total clans in "myClans"
         
         }else{
            // ask for clan tag, treat like its their first time using the app, display home view controller
            
         }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()  // check the UserDefaults for availabtle clan
        errorView.isHidden = true
        print("Loaded")
        // let indexPath = IndexPath(item: 0, section: 0)
        // tableView.deleteRows(at: [indexPath], with: .fade)
       
        
        // delegate shit nameTextField.delegate = self
        // Use viewWillAppear() to consume from the API
          // - also grab info from UserDefaults to see all the User's clans.
          // - also grab data from User's clans and add to clan's total.
        
        // dump(Array(UserDefaults.standard.dictionaryRepresentation().keys))  -- to clean up my UserDefaults
        
    }
    
}



// Code for seeInfo - reads in and displays the clan info
/*
 if let activeClan = UserDefaults.standard.object(forKey: "activeClan") as? String{ // if active clan is not nil
 // creates and loads the clan that the user picked to be active
 var newClan = theClan()
 newClan = loadClan(activeClan: activeClan)
 
 textView.text = newClan.displayInTextView()
 newClan.sortArray(sortType: "byWorth")
 newClan.displayClanNames()
 
 }else{
 textView.text = "There is no clan to display"
 }*/

//code for saveClan - saves the clan to the UserDefaults
/*
 // Calls the API
 // possible error handling in these
 myAPIClanGrab(withLocation: "9GCQYY0C") { (didWork: String) in
 print("didWork: ", didWork)
 }
 myAPIWarlogGrab(withLocation: "9GCQYY0C") { (didWork: String) in
 print("didWork: ", didWork)
 }
 
 To start server: cd documents/ManagerRoyaleAPI
                  export FLASK_APP=fetchClan.py
                  flask run
 */


