//
//  HorizontalImageScrollerExtension.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/16/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation
import UIKit

extension ViewControllerModified {
    
    func horizontalImageScrollerSetup() {
        
        imgArrayForScroller = [#imageLiteral(resourceName: "princesses"), #imageLiteral(resourceName: "princesses"), #imageLiteral(resourceName: "princesses"), #imageLiteral(resourceName: "princesses"), #imageLiteral(resourceName: "princesses"), #imageLiteral(resourceName: "princesses")]  // image literal haha
        horizontalImageScroller.showsHorizontalScrollIndicator = false
        horizontalImageScroller.delegate = self
        horizontalImageScroller.isPagingEnabled = true
        imgScrollerframe.origin.x = horizontalImageScroller.frame.size.width // *CGFloat(index)
        
        for index in 0...imgArrayForScroller.count-1 {
            let imageView = UIImageView(frame: imgScrollerframe)
            imageView.image = imgArrayForScroller[index]
            imageView.contentMode = .scaleAspectFill
            
            let xPos = Int(self.horizontalImageScroller.frame.width) * index
      //      let xPos = Int(self.view.frame.width) * index
            print(xPos)
            
            imageView.frame = CGRect(x: CGFloat(xPos), y: 0, width: self.horizontalImageScroller.frame.width, height: self.horizontalImageScroller.frame.height)
            horizontalImageScroller.contentSize.width = horizontalImageScroller.frame.width * CGFloat((index + 1))
            
            horizontalImageScroller.addSubview(imageView)
        }
        
  //      imageView.image = UIImage(named: "princesses")
  //      self.horizontalImageScroller.addSubview(imageView)
    }
}

extension ViewControllerModified {
    // borrowed, needs to be refactored
//    func configure(movie: Results) {
//      let posterPath = movie.poster_path
//      let urlString = dowloadURL + posterPath
//      guard let url = URL(string: urlString) else { return }
//      print(url, "sd_setImage")
//      poster.sd_setImage(with: url, placeholderImage: nil, options: [], context: nil)
//    }
}
