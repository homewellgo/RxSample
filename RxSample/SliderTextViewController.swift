//
//  SliderTextViewController.swift
//  RxSample
//
//  Created by PB2 on 2017/10/12.
//  Copyright © 2017年 homewellgo. All rights reserved.
//

import UIKit

class SliderTextViewController: UITableViewController {

    typealias ItemsType = [String]
    typealias CellClass = SliderTextCell
    let nibFile = ""
    let cellID = "cell"
    
    let items: ItemsType = ["AQ", "B"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(CellClass.self, forCellReuseIdentifier: cellID)
        
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CellClass
        
        let item = items[indexPath.row]
        
        return cell
    }
}
