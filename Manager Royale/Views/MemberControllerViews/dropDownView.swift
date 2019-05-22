//
//  dropDownView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/30/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import UIKit

class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    var dropDownOptions = ["Worth", "War Days Won", "Trophies", "Cards Collected", "Last Battle"]
    var rowCount:Int = 5
    
    var delegate : sortTableProtocol!
    var otherDelegate : dismissSortTabelProtocol!
    
    var dropDownTableView = UITableView()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        //dropDownTableView.backgroundColor = .darkGray
        //self.backgroundColor = .darkGray
        dropDownTableView.rowHeight = 25
        
        dropDownTableView.delegate = self
        dropDownTableView.dataSource = self
        
        dropDownTableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(dropDownTableView)
        
        dropDownTableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        dropDownTableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        dropDownTableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        dropDownTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        /*cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.darkGray*/
        cell.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.text = dropDownOptions[indexPath.row]
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.dropDownTableView.deselectRow(at: indexPath, animated: true)
        
        // use protocal, call dismissDropDown(), and sort table + reload rows
        print(dropDownOptions[indexPath.row])
        self.delegate.dropDownPress(sortType: dropDownOptions[indexPath.row])
        self.otherDelegate.dismissDropDown()
    }

}




