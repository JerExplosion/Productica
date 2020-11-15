//
//  NewVersionOfMovieCollectionViewCell.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/13/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import UIKit

class NewVersionOfMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    static func nibbing() -> UINib {
        return UINib(nibName: GloballyApplied.newMovieCollectionViewCellNibID, bundle: nil)
    }
    
    public func cellConfiguration(with customImage: UIImage) {
        self.movieImgView.image = customImage
    }
}

extension ViewControllerModified {
    func collectionViewSetup() {
        moviesCollectionView.dataSource = self
        moviesCollectionView.delegate = self
    }
    func xibCollectRegistrationSetup() {
        self.moviesCollectionView.register(NewVersionOfMovieCollectionViewCell.nibbing(), forCellWithReuseIdentifier: GloballyApplied.newMovieCollectionViewCellNibID)
    }
}
    
