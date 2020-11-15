//
//  DetailViewController.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/4/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
  
  var id: Int?
  let detailsVM = DetailsVM()
  var genres: [Genre]?
  var genreLabels: [UILabel] = []
  
  @IBOutlet weak var poster: UIImageView!
  @IBOutlet weak var movieTitle: UILabel!
  @IBOutlet weak var dateView: UILabel!
  @IBOutlet weak var overview: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .clear
    overview.numberOfLines = 0
    let detailsURL = detailStartingURL + "\(id ?? 0)" + apiKey
    print(detailsURL)
    detailsVM.getDetail(urlString: detailsURL) {
//      let details = self.detailsVM.getDetailResult()
//      self.movieTitle.text = details.title
//      let date = details.release_date
//      let runtime = details.runtime
//      self.dateView.text = date.formatDate(dateString: date) + " - " + runtime.formatTime(timeInt: runtime)
//      self.overview.text = details.overview
//      self.genres = details.genres
//      self.setUpGenre()
//      let posterPath = details.poster_path
//      self.downloadImage(posterPath: posterPath)
    }
    
  }
  
  func downloadImage(posterPath: String) {
    let urlString = dowloadURL + posterPath
    guard let url = URL(string: urlString) else { return }
    poster.sd_setImage(with: url, placeholderImage: nil, options: [], context: nil)
  }
  
  @IBAction func cancelAction(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }
  
  func setUpGenre() {
    guard let genreLoop = genres else { return }
    var count = 0
    
    for genre in genreLoop {
      genreLabels.append(UILabel())
      let capiltalizedGenre = genre.name.uppercased()
      genreLabels[count].text = capiltalizedGenre
      genreLabels[count].backgroundColor = .white
      genreLabels[count].textColor = .black
      genreLabels[count].layer.masksToBounds = true
      genreLabels[count].layer.cornerRadius = 2
      view.addSubview(genreLabels[count])
      genreLabels[count].translatesAutoresizingMaskIntoConstraints = false
      genreLabels[count].topAnchor.constraint(equalTo: overview.bottomAnchor).isActive = true
      if count != 0 {
        genreLabels[count].leadingAnchor.constraint(equalTo: genreLabels[count-1].trailingAnchor, constant: 5).isActive = true
      } else {
        genreLabels[count].leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 30).isActive = true
      }
      count += 1
      
    }
  }
  
  
}
