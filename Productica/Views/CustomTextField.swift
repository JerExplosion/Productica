//
//  CustomTextField.swift
//  Productica
//
//  Created by Jerry Ren on 4/20/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
    open class TextFieldCustomization: UITextField {

        func setUp() {
            let txtFBorder = CALayer()
            let width = CGFloat(2.0)
            txtFBorder.borderColor = UIColor.lightGray.cgColor
            // color is crucial
            
            txtFBorder.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
            txtFBorder.borderWidth = width
            self.layer.addSublayer(txtFBorder)
            self.layer.masksToBounds = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    required public init?(coder tDecoder: NSCoder) {
        super.init(coder: tDecoder)
        setUp()
    }
}
