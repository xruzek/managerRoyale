//
//  myClanViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 2/12/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class myClanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // global variables needed for the second view controller
    var activeClanTable:theClan = theClan()
    let cellReuseIdentifier = "cell"
    var isClickedOnArray:[Bool] = []
    var lastNumClicked = 0
    
    // loads in what we need in order to display proper information for the table
    override func viewWillAppear(_:Bool) {
        if let activeClan = UserDefaults.standard.object(forKey: "activeClan") as? String{ // if active clan is not nil
            // creates and loads the clan that the user picked to be active
            var newClan = theClan()
            newClan = loadClan(activeClan: activeClan)
            newClan.sortArray(sortType: "byWorth")
            for memeber in newClan.playerArray{
                isClickedOnArray.append(false)
            }
            activeClanTable = newClan
            tableView.reloadData()
        }else{
            activeClanTable = theClan() // Display "no clans added"
        }
    }
    // Outlets for the ranking drop down
    
    // Buttons for the ranking drop down
    
    
    //@IBAction func byDonations(_ sender: Any) {
        //activeClanTable.sortArray(sortType: "byDonations")
        //tableView.reloadData()
        //donationsOutlet.setTitle("my text here", for: .normal)
        //donationsOutlet.isHidden = true
    //}
   
    @IBOutlet var tableView: myClanTableView! // Outlet for the table
    
    // Calls delegate function to build the table
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // creates the numer of rows in the cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activeClanTable.playerArray.count
    }
    
    // Creates each cell of the table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:myClanTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! myClanTableViewCell
        
        // When not tapped on
        cell.cellMore.isHidden = false
        cell.cellName.text = activeClanTable.playerArray[indexPath.row].name
        cell.cellWorth.text = String(Int(activeClanTable.playerArray[indexPath.row].Worth))
        
        
        cell.cellCount.text = String(indexPath.row + 1)
        
        /*// cellCount contraints
        cell.cellCount.translatesAutoresizingMaskIntoConstraints = false
        
        cell.cellCount.leftAnchor.constraint(equalTo: , constant: 5.0).isActive = false
        cell.cellCount.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 50.0)*/
        
        cell.cellTrophies.text = String(activeClanTable.playerArray[indexPath.row].trophies)
        cell.cellDonations.text = String(activeClanTable.playerArray[indexPath.row].donations)
        cell.cellRole.text = activeClanTable.playerArray[indexPath.row].role
        
        // When tapped on
        if isClickedOnArray[indexPath.row] {
            cell.cellMore.isHidden = true
        }
        cell.cellCollectionBattles.text = String(activeClanTable.playerArray[indexPath.row].collectionBattlesPlayed)
        cell.cellCardsEarned.text = String(activeClanTable.playerArray[indexPath.row].cardsEarned)
        cell.cellDonationsRecieved.text = String(activeClanTable.playerArray[indexPath.row].donationsReceived)
        cell.cellWarDaysPlayed.text = String(activeClanTable.playerArray[indexPath.row].warDaysPlayed)
        cell.cellWarDaysWon.text = String(activeClanTable.playerArray[indexPath.row].warDaysWon)
        cell.cellWarDaysMissed.text = String(activeClanTable.playerArray[indexPath.row].warDaysNotPlayed)
        if(activeClanTable.playerArray[indexPath.row].warDaysNotPlayed > 0){
            cell.cellWarDaysMissed.textColor = UIColor.red
        }else{
            cell.cellWarDaysMissed.textColor = UIColor.blue
        }
        
        return cell
    }
    
    // Function that runs when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath.row != lastNumClicked){
            isClickedOnArray[lastNumClicked] = false
            let indexPath = IndexPath(item: lastNumClicked, section: 0)
            tableView.reloadRows(at: [indexPath], with: .top)
        }

        isClickedOnArray[indexPath.row] = !isClickedOnArray[indexPath.row]
        lastNumClicked = indexPath.row
        
        print("You tapped cell number \(indexPath.row).")
        let indexPath = IndexPath(item: indexPath.row, section: 0)
        tableView.reloadRows(at: [indexPath], with: .top)
        
    }
    
    // Edits the size of each cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if(isClickedOnArray[indexPath.row]){

            return 250
        }else if isClickedOnArray[indexPath.row] == false{
  
        return 100 //or whatever you need
            
        }else{
            return 60
        }
    }
 
}



// The cell class, contains connections to the view
class myClanTableViewCell: UITableViewCell {
    // When not tapped on
    @IBOutlet weak var cellMore: UILabel!
    @IBOutlet weak var cellCount: UILabel!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellTrophies: UILabel!
    @IBOutlet weak var cellDonations: UILabel!
    @IBOutlet weak var cellRole: UILabel!
    @IBOutlet weak var cellWorth: UILabel!
    
    // When tapped on
    @IBAction func cellPastWarButton(_ sender: UIButton) {
        displayPastWars(whichCell: Int(cellCount.text!)!)
    }
    @IBOutlet weak var cellCollectionBattles: UILabel!
    @IBOutlet weak var cellDonationsRecieved: UILabel!
    @IBOutlet weak var cellWarDaysPlayed: UILabel!
    @IBOutlet weak var cellWarDaysWon: UILabel!
    @IBOutlet weak var cellCardsEarned: UILabel!
    @IBOutlet weak var cellWarDaysMissed: UILabel!
    
    
}

// Will display the past 10 wars for the selected member
func displayPastWars(whichCell:Int) {
    let theCell = whichCell - 1 // cus players[] starts at 0
    //print("This is the cell: ", theCell)
    
    
    
}

// Class for the table
class myClanTableView: UITableView {
    
}
