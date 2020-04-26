//
//  ContainerViewController.swift
//  Productica
//
//  Created by Jerry Ren on 4/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit


class ContainerViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(flickSideMenu), name: NSNotification.Name(rawValue: "Flick"), object: nil)
        
    }
    

    var sideMenuRevealed = false
    
    @IBOutlet weak var sideMenuConstraint: NSLayoutConstraint!
    
    @objc func flickSideMenu() {
        
        if sideMenuRevealed == true {
            sideMenuConstraint.constant = -267
            sideMenuRevealed = !sideMenuRevealed
        } else {
            sideMenuConstraint.constant = 0
            sideMenuRevealed = !sideMenuRevealed
        }
        
    }
    
    
     
}
