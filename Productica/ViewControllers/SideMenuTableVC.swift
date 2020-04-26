//
//  SideMenuTableVC.swift
//  Productica
//
//  Created by Jerry Ren on 4/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class SideMenuTableVC: UITableViewController {
  
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        NotificationCenter.default.post(name: Notification.Name("Flick"), object: nil)
        
        switch indexPath.row {   
        
        case 1:
            NotificationCenter.default.post(name: Notification.Name(rawValue:"revealOG"), object: nil)

        default:
            break
        }
        
        
        
    }

}
