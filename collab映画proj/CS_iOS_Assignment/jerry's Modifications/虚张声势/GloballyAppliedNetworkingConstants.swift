//
//  Atarashi Uno.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/13/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

struct GloballyAppliedNetworkingConstants {
    static let dispatchQueueLabel = "WorkNetClassy"
    static let baseURLString = "BASE_URL"
    static let nothingness = ""
    static let getMethod = "GET"
    static let postMethod = "POST"
    static let applicationSlashJson = "application/json"
    static let contentType = "Content-Type"
}

protocol CodaModel: Codable {  }
