//
//  GloballyUsed.swift
//  Productica
//
//  Created by Jerry Ren on 4/9/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct GloballyUsed {
    static let TDVCcellID = "TDVCcelloID"
    static let uDefaultsKey = "TDkey"
    static let burgerMenuImage = "64pixelsBPthreeBurgers.png"
    static let cstCelloID = "celloAsUsual"
}

extension TDViewController {
    func illustrativeItemsInitiation() {
        let newItem0 = Item(context: sharedContext)
        newItem0.title = "Extra thrust"
        itemArray.append(newItem0)
        
        let newItem1 = Item(context: sharedContext)
        newItem1.title = "Harder thrust"
        itemArray.append(newItem1)
        
        let newItem2 = Item(context: sharedContext)
        newItem2.title = "Push thrust"
        itemArray.append(newItem2)
    }
}
