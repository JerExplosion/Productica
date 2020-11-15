//
//  Extensions.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

extension String {
  func formatDate(dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let formattedDate = dateFormatter.date(from: dateString)
    dateFormatter.dateFormat = "MMMM dd,yyyy"
    let formattedString = dateFormatter.string(from: formattedDate!)
    return formattedString
  }
}

extension Int {
  func formatTime(timeInt: Int) -> String {
    let hrs = timeInt/60
    let mins = timeInt % 60
    return "\(hrs)hr" +  " " + "\(mins)m"
  }
}

extension URLSession: Session {
  func getData(from url: URL, completion: ((Data?, URLResponse?, Error?) -> Void)?) {
    dataTask(with: url) { data, response, error in
      DispatchQueue.main.async {
        completion?(data, response, error)
      }
    }.resume()
  }
}


