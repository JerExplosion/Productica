//
//  WorkNetClassy.swift
//  CS_iOS_Assignment
//
//  Created by Jerry Ren on 11/14/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import Foundation

protocol WorkNetProtocol {
    func sending(urlRequest: URLRequest, completion: (Result<Data, Error>)->Void)
}

// class WorkNet { }   (coming soon)

