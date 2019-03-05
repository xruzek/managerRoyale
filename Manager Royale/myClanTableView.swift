//
//  myClanTableView.swift
//  Manager Royale
//
//  Created by Rex Ruzek on 3/5/19.
//  Copyright © 2019 Rex Ruzek. All rights reserved.
//

import Foundation
import UIKit

struct CellData {
    let name : String
    let cellCount : Int
    let trophies : Int
    let donations : Int
    let warScore : Int
}
class MyClanTableView : UITableView {
    var data = [CellData]()
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        <#code#>
    }
    
    override func numberOfRows(inSection section: Int) -> Int {
        <#code#>
    }
    
    
}
