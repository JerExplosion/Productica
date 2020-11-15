//
//  AppearanceDependencies.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/13/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import UIKit

// MARK: - IMV
@IBDesignable class RImageView: UIImageView {
    @IBInspectable var cRadio: CGFloat = 5.55 {
        didSet {
            self.layer.cornerRadius = cRadio
}}}

// MARK: - BTN
@IBDesignable class RButton: UIButton {
    @IBInspectable var cRadio: CGFloat = 3.33 {
        didSet {
            self.layer.cornerRadius = cRadio
}}}



