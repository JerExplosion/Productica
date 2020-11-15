//
//  PopularVM.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

class PopularVM {
  
  private var errorMessage = ""
  private var totalResult = 0
  private var page = 1
  private var popularArray: [PopularResult] = []
  
  func fetchPopularMovies(session: Session = URLSession.shared, urlString: String = popularMoviesUrl, completion: (() -> Void)?) {
    let urlStr = urlString + "\(page)"
    guard let url = URL(string: urlStr) else {
      completion?()
      return
    }
    
    session.getData(from: url) { [weak self] (data, response, error) in
      defer{completion?()}
      if let error = error {
        self?.errorMessage += "DataTask error: " + error.localizedDescription + "\n"
      } else if let data = data {
        do {
          let jsonObj = try JSONDecoder().decode(PopularModel.self, from: data)
          self?.popularArray += jsonObj.results
          self?.totalResult = jsonObj.total_results
        } catch _ as NSError {
          return
        }
        self?.page += 1
      }
    }
  }
  
  func getNumberOfMovies() -> Int {
    return popularArray.count
  }
  
  func getMovie(at index: Int) -> PopularResult {
    return popularArray[index]
  }
  
  func getTotalResult() -> Int {
    return totalResult
  }
  
  func getErrorMessage() -> String {
    return errorMessage
  }
}
