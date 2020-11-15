//
//  NowPlayingModel.swift
//  CS_iOS_Assignment
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

struct NowPlayingModel: Codable {
  let results: [Results]
}

struct Results: Codable {
  let poster_path: String
  let id: Int
}

