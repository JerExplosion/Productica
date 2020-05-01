//
//  CstEloViewC.swift
//  Productica
//
//  Created by Jerry Ren on 4/29/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

class CstEloViewC: UIViewController {
    
    @IBOutlet weak var cstEloTableV: UITableView!
       
    var destinationArray = ["Carribean", "Burma", "Indonesia", "Japan", "Laos", "Philippines"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cstEloTableV.dataSource = self
        cstEloTableV.delegate = self
    }
    
    
}



extension CstEloViewC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cElo = cstEloTableV.dequeueReusableCell(withIdentifier: GloballyUsed.cstCelloID, for: indexPath) as! CstTviCell
        
        cElo.cstCelloRabel.text = destinationArray[indexPath.row]
        cElo.cstCelloImage.image = UIImage(named: destinationArray[indexPath.row])
        
        cElo.cstCelloView.layer.cornerRadius = cElo.cstCelloView.frame.height / 2
        cElo.cstCelloImage.layer.cornerRadius = cElo.cstCelloImage.frame.height / 2
        cElo.cstCelloRabel.layer.cornerRadius = cElo.cstCelloRabel.frame.height / 2
        
        cElo.cstCelloRabel.clipsToBounds = true
        
        return cElo 
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return destinationArray.count
    }

    
}

