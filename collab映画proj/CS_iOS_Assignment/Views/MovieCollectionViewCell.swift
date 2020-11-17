//
//  MovieCollectionViewCell.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/4/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
  @IBOutlet weak var poster: UIImageView!
  
  func configure(movie: Results) {
    let posterPath = movie.poster_path
    let urlString = dowloadURL + posterPath
    guard let url = URL(string: urlString) else { return }
    print(url, "sd_setImage")
    poster.sd_setImage(with: url, placeholderImage: nil, options: [], context: nil)
  }
  
}
