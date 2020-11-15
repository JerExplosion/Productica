//
//  DetailModel.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

struct DetailModel: Codable {
  let genres: [Genre]
  let poster_path: String
  let release_date: String
  let runtime: Int
  let overview: String
  let title: String
}

struct Genre: Codable {
  let name: String
}
