//
//  TDViewController.swift
//  Productica
//
//  Created by Jerry Ren on 4/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class TDViewController: UITableViewController {
    
    var objectArray = ["Squat", "Broad jump", "Plank", "Pull ups", "Windmill", "30 Yard dash"]
    
    let uDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let objar = uDefaults.array(forKey: GloballyUsed.uDefaultsKey) as? [String] {
            objectArray = objar
        }
    }
        
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GloballyUsed.TDVCcellID, for: indexPath)
        cell.textLabel?.text = objectArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
    @IBAction func cornerBarButtonTapped(_ sender: UIBarButtonItem) {
        
        var localTextField = UITextField()
        
        let alertC = UIAlertController(title: "Appending new item", message: "no message", preferredStyle: .alert)
        
        alertC.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Event Name"
            localTextField = alertTextField
            
            print(alertTextField.text )
        }
        
        let alertAction = UIAlertAction(title: "Execute", style: .destructive) { (action) in
            self.objectArray.append(localTextField.text!)
            
            self.uDefaults.set(self.objectArray, forKey: GloballyUsed.uDefaultsKey)
             
            
            self.tableView.reloadData()
        }
        
        alertC.addAction(alertAction)
        
        present(alertC, animated: true, completion: nil)
         
    }
    
}
  
