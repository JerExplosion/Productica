//
//  DetailsVM.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

class DetailsVM {
  
  private var errorMessage = ""
    // why did they force-unwrap smh
  private var detail: DetailModel?
  private var bool = true
  
  func getDetail(session: Session = URLSession.shared, urlString: String, completion: (() -> Void)?) {
    guard let url = URL(string: urlString) else {
      completion?()
      return
    }
    session.getData(from: url) { (data, response, error) in
      defer{completion?()}
      if let error = error {
        self.errorMessage = "DataTask error: " + error.localizedDescription + "\n"
      } else if let data = data {
        do {
          self.detail = try JSONDecoder().decode(DetailModel.self, from: data)
        } catch _ as NSError {
          self.bool = false
          return
        }
        
      }
    }
  }
  
  func getDetailResult() -> DetailModel? {
    return detail
  }
  
  func isThereData() -> Bool {
    return bool
  }
  
  func getErrorMessage() -> String {
    return errorMessage
  }
}
