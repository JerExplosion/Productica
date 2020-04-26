//
//  MajorViewC.swift
//  Productica
//
//  Created by Jerry Ren on 4/16/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class MajorViewC: UIViewController {
    
    @IBOutlet weak var threeBurgersBarButton: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        threeBurgersBarButton.image = UIImage(named: "64pixelsBPthreeBurgers.png")?.withRenderingMode(.alwaysOriginal)
        
        NotificationCenter.default.addObserver(self, selector: #selector(linkToOG), name: NSNotification.Name(rawValue: "revealOG"), object: nil)
        
    }
    
    @IBAction func threeBurgersTapped(_ sender: UIBarButtonItem) {
        
        NotificationCenter.default.post(name: NSNotification.Name("Flick"), object: nil)
        
    }
    
    @objc func linkToOG() {

        performSegue(withIdentifier: "revealOG", sender: nil)
        
    }
    
  

}
