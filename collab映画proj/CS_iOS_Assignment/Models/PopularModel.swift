//
//  PopularModel.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

struct PopularModel: Codable {
  let total_results: Int
  let results: [PopularResult]
}

struct PopularResult: Codable {
  let poster_path: String
  let id: Int
  let title: String
  let vote_average: Double
  let release_date: String
}
