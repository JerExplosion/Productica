//
//  RatingView.swift
//  CS_iOS_Assignment
//
//  Copyright © 2019 Backbase. All rights reserved.
//

import UIKit

class RatingView: UIView {
  
  let ratingLayer = CAShapeLayer()
  let percentLayer = CAShapeLayer()
  let percentString = CATextLayer()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    initSubviews()
    
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    initSubviews()
  }
  
  func initSubviews() {
    self.backgroundColor = UIColor.black
    createCircularPath()
  }
  
  func createCircularPath() {
    self.backgroundColor = .clear
    self.layer.cornerRadius = self.bounds.size.width/2
    let circlePath = UIBezierPath(arcCenter: CGPoint(x: bounds.size.width/2, y: bounds.size.height/2), radius: (bounds.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
    ratingLayer.path = circlePath.cgPath
    ratingLayer.fillColor = UIColor.clear.cgColor
    ratingLayer.strokeColor = UIColor.gray.cgColor
    ratingLayer.lineWidth = 5.0
    ratingLayer.strokeEnd = 1.0
    layer.addSublayer(ratingLayer)
    percentLayer.path = circlePath.cgPath
    percentLayer.fillColor = UIColor.clear.cgColor
    percentLayer.strokeColor = UIColor.black.cgColor
    percentLayer.lineWidth = 5.0
    percentLayer.strokeEnd = 0.0
    layer.addSublayer(percentLayer)
    percentString.backgroundColor = UIColor.clear.cgColor
    percentString.frame = CGRect(x: 7, y: 15, width: layer.frame.width, height: layer.frame.height)
    percentString.fontSize = 12
    percentString.alignmentMode = .center
    layer.addSublayer(percentString)
  }

  func setProgressWithAnimation(value: Float) {
    percentLayer.strokeColor = value < 5 ? UIColor.yellow.cgColor : UIColor.green.cgColor
    percentString.foregroundColor = UIColor.white.cgColor
    percentLayer.strokeEnd = CGFloat(value/10)
    percentString.string = "\(Int(value*10)) %"

  }
}
