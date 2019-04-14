//
//  MembersViewController.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class MembersViewController: UITableViewController, sortTableProtocol {
    let header = memberTableHeaderView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        header.setUpView()
        
        //self.tableView.delegate = self
        //self.tableView.dataSource = self
        
        //navigationController?.setNavigationBarHidden(true, animated: false)
        
        navigationItem.title = "Members"
        self.tableView.register(memberCell.self, forCellReuseIdentifier: "member")
        self.tableView.rowHeight = GlobalVariables.cellHeight
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return GlobalVariables.cellHeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return header
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "member") as! memberCell
        
        // calls function in memberCell that calls a function to the needed labels & sets them up
        cell.setUpCell(index: indexPath.row)
       
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GlobalVariables.activeClan.playerArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //header.displayMemberInfo(index: indexPath.row)
        GlobalVariables.memberTapped = GlobalVariables.activeClan.playerArray[indexPath.row]
        show(memberInfo, sender: self)
        
    }
    
    func dropDownPress(sortType: String) {
        GlobalVariables.activeClan.sortArray(sortType: sortType)
        
        var count = 0
        for _ in GlobalVariables.activeClan.playerArray {
            let indexPath = IndexPath(item: count, section: 0)
            self.tableView.reloadRows(at: [indexPath], with: .none)
            count += 1
        }
    }
    
}





/* peep this "live playground" thing when ya get a chance
 let vc = TestViewController()
 vc.view.backgroundColor = .yellow
 PlaygroundPage.current.liveView = vc
 */

