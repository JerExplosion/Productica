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
    
    var itemArray = [Item]()
    
    let sharedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        illustrativeItemsInitiation()
        
    }
    

    @IBAction func cornerBarButtonTapped(_ sender: UIBarButtonItem) {
        
        var localTextField = UITextField()
        
        let alertC = UIAlertController(title: "Appending new item", message: "no message", preferredStyle: .alert)
        
        alertC.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Event Name"
            localTextField = alertTextField
            
            print(alertTextField.text)
        }
        
        let alertAction = UIAlertAction(title: "Execute", style: .destructive) { (action) in
            
            let newItem = Item(context: self.sharedContext)
            
            newItem.title = localTextField.text!
            newItem.done = false
            self.itemArray.append(newItem)
            
            self.saveItems()
            
      //      self.tableView.reloadData()
        }
        
        alertC.addAction(alertAction)
        
        present(alertC, animated: true, completion: nil)
        
    }
    
    func saveItems() {
        
        do {
            try sharedContext.save()
        } catch {
            print("encountering an error tryna save sharedContext:   \(error )")
        }
        self.tableView.reloadData()
        
    }
    
    
    
}



// MARK: - Earlier Used Codes for User-Defaults' Experiment

//var objectArray = ["Squat", "Broad jump", "Plank", "Pull ups", "Windmill", "30 Yard dash"]

//if let objar = uDefaults.array(forKey: GloballyUsed.uDefaultsKey) as? [String] {
//    objectArray = objar
//}

// MARK: - Accessory Type specifically

//if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//    tableView.cellForRow(at: indexPath)?.accessoryType = .none
//} else {
//    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//}

//        if objectArray[indexPath.row].finished == false {
//            cell.accessoryType = .none
//        } else {
//            cell.accessoryType = .checkmark
//        }



// MARK: - Bits on NSCoder

// print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)


// MARK: - UserDefaults' partial codes

//    let uDefaults = UserDefaults.standard

//        if let objar = uDefaults.array(forKey: GloballyUsed.uDefaultsKey) as?
//            [ObjectsModel] {
//            objectArray = objar
//        }

//   self.uDefaults.set(self.objectArray, forKey: GloballyUsed.uDefaultsKey)

// MARK: - previous model

//          var objectArray = [ObjectsModel]()

//            let newObject = ObjectsModel()
//            newObject.title = "Extra thrust"
//            objectArray.append(newObject)
//
//            let newObject2 = ObjectsModel()
//            newObject2.title = "Harder thrust"
//            objectArray.append(newObject2)
//            newObject2.finished = true
//
//            let newObject3  = ObjectsModel()
//            newObject3.title = "Push thrust"
//            objectArray.append(newObject3)

//            let newObject = ObjectsModel()
//            newObject.title = localTextField.text!
//            self.objectArray.append(newObject)

//          return objectArray.count
//       objectArray[indexPath.row].finished = !objectArray[indexPath.row].finished

//        cell.textLabel?.text = objectArray[indexPath.row].title
//        let currentObject = objectArray[indexPath.row]
//        cell.accessoryType = currentObject.finished == false
//            ? .none : .checkmark



