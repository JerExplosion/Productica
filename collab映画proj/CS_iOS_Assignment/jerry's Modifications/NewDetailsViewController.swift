//
//  NewDetailsViewController.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/13/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import SDWebImage
import UIKit

class NewDetailsViewController: UIViewController {

    @IBOutlet weak var newMoviesDetailsImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionsLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    let detailsViewModel = DetailsVM.init()
    //
    var genres: [Genre]?
    var genreLabels: [UILabel] = []
    //
    var idNumb: Int?
                         
    override func viewDidLoad() {
        super.viewDidLoad()
        userinterfaceSetup()
        gettingDetails()
    }
    
    private func gettingDetails() {
        let detailsURLString = detailStartingURL + "\(idNumb ?? 0)" + apiKey
  //      let detailsURLString = GloballyApplied.detailStartingURL + "\(idNumb ?? 0)" + GloballyApplied.apiKey
        print(detailsURLString)
        
        detailsViewModel.getDetail(urlString: detailsURLString) {

            let details = self.detailsViewModel.getDetailResult()
            self.movieNameLabel.text = details?.title
            guard let date = details?.release_date else { return }
            guard let runtime = details?.runtime else { return }
            self.dateTimeLabel.text = date.formatDate(dateString: date) + " - " + runtime.formatTime(timeInt: runtime)
            self.descriptionsLabel.text = details?.overview
            self.genres = details?.genres
       //     self.setUpGenre()

            guard let imagePath = details?.poster_path else { return }
            self.imageDownloader(imagePath: imagePath)
        }
    }
    
    fileprivate func userinterfaceSetup() {
        newMoviesDetailsImageView.layer.masksToBounds = true
        newMoviesDetailsImageView.layer.cornerRadius = 30
        descriptionsLabel.numberOfLines = 0 
        view.alpha = 01_
        view.backgroundColor = .clear
    }
    
    private func imageDownloader(imagePath: String) {
        let urlString = dowloadURL + imagePath // refactor later
        guard let url = URL(string: urlString) else { return }
        newMoviesDetailsImageView.sd_setImage(with: url, placeholderImage: nil, options: [], context: nil)
    }
    
    @IBAction func backHome(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
