//
//  ViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 1/17/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

// Variables needed for the table
var myGlobalClansArray: [[String:Any]] = []
var activeClanObject = theClan()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // clanTag = "9GCQYY0C"
    // Contains the text the user entered  for the clan tag
    @IBOutlet weak var clanTagTextField: UITextField!
    
    
    // Trys to save the clan, returns messages if: wrong tag, already have tag saved, server down
    @IBAction func saveButton(_ sender: Any) {
        if !alreadyHaveClan(Tag: clanTagTextField.text!) {
            myAPIWarlogGrab(withLocation: clanTagTextField.text!) { (didWorkAswell: String) in
            }
            myAPIClanGrab(withLocation: clanTagTextField.text!) { (didWork: String) in
                DispatchQueue.main.async {
                    self.errorHandel(didWork: didWork)
                    // Read Current clan User Default, save that to past UserDefault, then whatever you read in the to new one.
                    if didWork == "worked" {
                        if var clansArray = UserDefaults.standard.array(forKey: "myClans") as? [[String: Any]]  {
                            clansArray.append(["tag": self.clanTagTextField.text!])
                            var newClan = theClan()
                            newClan = loadClan(activeClan: self.clanTagTextField.text!)
                            
                            // creates the members array UserDefault
                            let newClanBattleLogArray: [[String:Any]] = []
                            UserDefaults.standard.set(newClanBattleLogArray, forKey: newClan.clanTag + "members")
                            
                            for member in newClan.playerArray {
                                updateMemberList(withLocation: member) { (newDic: [String:Any]) in
                                    var newMemberBattleLogArray = UserDefaults.standard.object(forKey: newClan.clanTag + "members") as! [[String:Any]]
                                    newMemberBattleLogArray.append(newDic)
                                    UserDefaults.standard.set(newMemberBattleLogArray, forKey: newClan.clanTag + "members")
                                }
                            }
                            
                            UserDefaults.standard.set(clansArray, forKey: "myClans")
                            myGlobalClansArray = clansArray
                            self.allClansTable.reloadData()
                        }
                    }
                }
      
            }
        }else {
            self.errorView.isHidden = false
            self.errorLabel.text = "Already have that clan saved"
            // highlight clan saved in the list, and reload clan info
            
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
        
            if activeClan != "none" {
                // found a clan to display
                var newClan = theClan()
                newClan = loadClan(activeClan: activeClan)
                newClan.sortArray(sortType: "byWorth")
                
                // display active clan in active clans
                activeClanTag.text = newClan.clanTag
                activeClanName.text = newClan.clanName
                activeClanObject = newClan
                
                // display total clans in "myClans" (Table Stuff)
                if let clansArray = UserDefaults.standard.array(forKey: "myClans") as? [[String: Any]] {
                    myGlobalClansArray = clansArray
                }
            }
                // update all clan's progress UserDefualt variables( updateClansProgress ) - or do this when they reload a selected clan
           
         }else{
            // create UserDefaults array's ( myClans, activeClan )
            let newArray: [[String: Any]] = []
            UserDefaults.standard.set(newArray, forKey: "myClans")
            
            let activeClan = "none"
            UserDefaults.standard.set(activeClan, forKey: "activeClan")
         }
    }

    // Use for debuging and building the table
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets up the table for the First View
        allClansTable.delegate = self
        allClansTable.dataSource = self
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        errorView.isHidden = true
        
        
        // Seeing the clan with print, uncomment after running the program once to see the clan info
        var newClan = theClan()
        newClan = loadClan(activeClan: "9GCQYY0C") // need to add the new data I got from the member battle log to the members
        newClan.sortArray(sortType: "byWorth")
        newClan.displayClanNames()

        // Prints the member's past wars
        /*
        var count = 1
        for war in newClan.playerArray[14].warDayArray {
            print(newClan.playerArray[14].name)
            if war.collectionBattlesPlayed != 0 {
                print("\n-------War ", count," -------\n", "Cards Collected: ", war.cardsCollected!, "\ncollection Days Played: ", war.collectionBattlesPlayed, "\nMissed War Day: ", war.missedTheWarDay!, "\nPlayed The War Day: ", war.playedTheWarDay!, "\nWon The War Day: ", war.wonTheWarDay!)
            } else {
                print("\n-------War ", count," -------\nNO PARTICIPATION")
            }
            count += 1
        }*/
        
        //dump(Array(UserDefaults.standard.dictionaryRepresentation().keys))
        
        

    }
    
    
    
    //------------------------ My Clan's Table Code ------------------------\\
    
    @IBOutlet weak var allClansTable: UITableView!
    var cellIdentifier = "cell"
    
    // Variables:myClansArray & aClan are above the viewWillApear
    
    // Creates the numer of rows in the cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myGlobalClansArray.count
    }
    
    // Creates each cell of the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:allClansCell = self.allClansTable.dequeueReusableCell(withIdentifier: cellIdentifier) as! allClansCell
        
        cell.cellClanTag.text = myGlobalClansArray[indexPath.row]["tag"] as? String
        let aClan = loadClan(activeClan: cell.cellClanTag.text!)
        cell.cellClanName.text = aClan.clanName
        cell.count = indexPath.row
        
        if let activeClan = UserDefaults.standard.object(forKey: "activeClan") as? String {
            
            if activeClan != cell.cellClanTag.text! {
                cell.cellActivateOutlet.setTitleColor(.gray, for: .normal)
                cell.cellActivateOutlet.setTitle("Activate", for: .normal)
                
            } else {
                cell.cellActivateOutlet.setTitleColor(.blue, for: .normal)
                cell.cellActivateOutlet.setTitle("Activated", for: .normal)
                
                if myGlobalClansArray[0]["tag"] as! String != cell.cellClanTag.text! {
                    let temp:[String:Any] = ["tag": cell.cellClanTag.text!]
                    myGlobalClansArray.remove(at: cell.count)
                    myGlobalClansArray.insert(temp, at: 0)
                    UserDefaults.standard.set(myGlobalClansArray,forKey: "myClans")
                    self.allClansTable.reloadData()
                }
                
                
                activeClanName.text = cell.cellClanName.text!
                activeClanTag.text = cell.cellClanTag.text!
                
            }
        }
        return cell
    }
    
    // Outlets for the active clan
    @IBOutlet weak var activeClanName: UILabel!
    @IBOutlet weak var activeClanTag: UILabel!
    
    // Edits the size of each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }
    
    // Reloads the table
    @objc func loadList(){
        //load data here
        self.allClansTable.reloadData()
    }
}


// Class for allClans cell
class allClansCell: UITableViewCell {
    var count = 0
    @IBOutlet weak var cellClanName: UILabel!
    @IBOutlet weak var cellClanTag: UILabel!
    @IBOutlet weak var cellActivateOutlet: UIButton!
    @IBAction func cellActivateButton(_ sender: Any) {
        if cellActivateOutlet.titleLabel?.text! != "Activated"{
            UserDefaults.standard.set(myGlobalClansArray[count]["tag"] as? String, forKey: "activeClan")
            
            cellActivateOutlet.setTitleColor(.blue, for: .normal)
            cellActivateOutlet.setTitle("Activated", for: .normal)
            
            // reorder the myGlobalClansArray && myClans array
            let temp:[String:Any] = ["tag": cellClanTag.text!]
            myGlobalClansArray.remove(at: count)
            myGlobalClansArray.insert(temp, at: 0)
            UserDefaults.standard.set(myGlobalClansArray,forKey: "myClans")
            
            // Reload which clan is the active clan
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }
    }
    
}


// Class for the table
class allClansTable: UITableView {
    
}


 /*   Calls the API
 
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


