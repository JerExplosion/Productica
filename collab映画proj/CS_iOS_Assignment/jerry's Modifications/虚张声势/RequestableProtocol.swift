//
//  RequestableProtocol.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/14/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

protocol RequestabilityProtocol {
    func urlRequestGenerator() -> URLRequest
}

extension URLRequest: RequestabilityProtocol {
    func urlRequestGenerator() -> URLRequest {
        return self
    }
}
    
