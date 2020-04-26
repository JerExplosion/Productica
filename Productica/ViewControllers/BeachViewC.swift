//
//  BeachViewC.swift
//  Productica
//
//  Created by Jerry Ren on 4/18/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class BeachViewC: UIViewController {
    
    @IBOutlet weak var visualEffectBlurView: UIVisualEffectView!
    
    @IBOutlet weak var sideMenuView: UIView!
    
    @IBOutlet weak var leadingViewConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visualEffectBlurView.layer.cornerRadius = 15
        sideMenuView.layer.shadowColor = UIColor.black.cgColor
        sideMenuView.layer.shadowOpacity = 0.77
        sideMenuView.layer.shadowOffset = CGSize(width: 5, height: 0 )
        
     //   leadingViewConstraint.constant = -193
        leadingViewConstraint.constant = 0
        
    }
    
    @IBAction func panGesturePerformed(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 {
                if leadingViewConstraint.constant < 20 {
                    
                    UIView.animate(withDuration: 0.2, animations: {
                        self.leadingViewConstraint.constant += translation / 11
                        self.view.layoutIfNeeded()
                    })
                }
            } else {
                if leadingViewConstraint.constant > -193 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.leadingViewConstraint.constant += translation / 11
                        self.view.layoutIfNeeded() 
                    } )
                }
            }
            
        } else if sender.state == .ended {
            if leadingViewConstraint.constant < -70 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.leadingViewConstraint.constant = -193
                    self.view.layoutIfNeeded()
                } )
            } else {
                
            }
        }
        
    }
    
    
}

