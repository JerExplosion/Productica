//
//  ModifiedModelsCollection.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/13/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

struct NewDetailModel: Codable {
  let genres: [Genre]
  let posterPath: String
  let releaseDate: String
  let runtime: Int
  let overview: String
  let title: String
    private enum CodingKeys: String, CodingKey {
        case genres, posterPath = "poster_path"
        case releaseDate = "release_date", runtime
        case overview, title
    }
}
struct NewGenre: Codable {
  let name: String
}

// MARK -
struct NewNowPlayingModel: Codable {
  let results: [NewResults]
}
struct NewResults: Codable {
  let posterPath: String
  let id: Int
    
    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path", id
    }
}
 
// MARK -

struct NewPopularModel: Codable {
  let totalResults: Int
  let results: [PopularResult]
    
    private enum CodingKeys: String, CodingKey {
        case totalResults = "total_results", results
    }
}
struct NewPopularResult: Codable {
  let posterPath: String
  let id: Int
  let title: String
  let voteAverage: Double
  let releaseDate: String
    
    private enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path", id, title
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}




//private enum CodingKeys: String, CodingKey {
//
//}

