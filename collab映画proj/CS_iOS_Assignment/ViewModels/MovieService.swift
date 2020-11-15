//
//  MovieService.swift
//  CS_iOS_Assignment
//
//  Copyright © 2019 Backbase. All rights reserved.
//

import Foundation

class MovieService {

  private var errorMessage = ""
  private var jsonArray: [Results] = []
  
  func fetchMovies(session: Session = URLSession.shared, urlString: String = movieUrl, completion: (() -> Void)?) {
    
    guard let url = URL(string: urlString) else {
      completion?()
      return
    }
    
    session.getData(from: url) { (data, response, error) in
      defer { completion?() }
      if let error = error {
        self.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
      } else if let data = data {
        do {
          let jsonObject = try JSONDecoder().decode(NowPlayingModel.self, from: data)
          self.jsonArray = jsonObject.results
        } catch _ as NSError {
          return
        }
      }
    }
  }
  
  func getNumberOfMovies() -> Int {
    return jsonArray.count
  }
  
  func getMovie(at index: Int) -> Results {
    return jsonArray[index]
  }
  
  func getErrorMessage() -> String {
    return errorMessage
  }
  
}

protocol Session {
  func getData(from url: URL, completion: ((Data?, URLResponse?, Error?) -> Void)?)
}
