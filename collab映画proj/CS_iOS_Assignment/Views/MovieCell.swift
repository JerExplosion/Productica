//
//  MovieCell.swift
//  CS_iOS_Assignment
//
//  Copyright © 2019 Backbase. All rights reserved.
//

import UIKit
import SDWebImage

//
// MARK: - Movie Cell
//
class MovieCell: UITableViewCell {
  
  //
  // MARK: - Class Constants
  //
  static let identifier = "MovieCell"
  
  //
  // MARK: - IBOutlets
  //
  @IBOutlet weak var title: UILabel!
  @IBOutlet weak var rating: RatingView!
  @IBOutlet weak var releaseDate: UILabel!
  @IBOutlet weak var poster: UIImageView!
  @IBOutlet weak var timeView: UILabel!
  
  
  func configure(movie: PopularResult) {
    title.text = movie.title
    releaseDate.text = movie.release_date.formatDate(dateString: movie.release_date)
    let urlString = dowloadURL + movie.poster_path
    guard let url = URL(string: urlString) else { return }
    poster.sd_setImage(with: url, placeholderImage: nil, options: [], context: nil)
    rating.setProgressWithAnimation(value: Float(movie.vote_average))
    let detailsVM = DetailsVM()
    let detailsURL = detailStartingURL + "\(movie.id)" + apiKey
    detailsVM.getDetail(urlString: detailsURL) {
    guard let runtime = detailsVM.getDetailResult()?.runtime else { return }
      self.timeView.text = runtime.formatTime(timeInt: runtime)
    }
  }
}


