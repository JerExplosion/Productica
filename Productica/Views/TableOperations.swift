//
//  TableOperations.swift
//  Productica
//
//  Created by Jerry Ren on 4/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit
import CoreData

extension TDViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRow called ")
        let cell = tableView.dequeueReusableCell(withIdentifier: GloballyUsed.TDVCcellID, for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        let currentItem = itemArray[indexPath.row]
        
        cell.accessoryType = currentItem.done == false
            ? .none : .checkmark
    
        return cell
    } 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true )
    }



}
