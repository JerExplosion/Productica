//
//  GloballyApplied.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/13/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

struct GloballyApplied {
    static let apiKey = "?api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
    // to optimize security, for a real project, put this into plist.
    static let movieUrl = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=undefined&api_key=55957fcf3ba81b137f8fc01ac5a31fb5"
    static let popularMoviesUrl = "https://api.themoviedb.org/3/movie/popular?api_key=55957fcf3ba81b137f8fc01ac5a31fb5&language=en-US&page="
    static let detailStartingURL = "https://api.themoviedb.org/3/movie/"
    static let dowloadURL = "https://image.tmdb.org/t/p/w500"
    static let mainSB = "Main"
    
    static let newDetailsViewControllerStoryboardID = "NewDetailsViewController"
    static let newMovieCollectionViewCellNibID = "NewVersionOfMovieCollectionViewCell"
}    
