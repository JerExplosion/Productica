//
//  DetailsTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

class DetailsTests: XCTestCase {
  
  var sut: DetailsVM!
  override func setUp() {
    super.setUp()
    sut = DetailsVM()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  // MARK: - Details Test
  func testGetDetail() {
    let movieExpectation = expectation(description: "Wait for API Call")
    let detailsURL = detailStartingURL + "724989" + apiKey
    sut.getDetail(urlString: detailsURL) {
      XCTAssertEqual(self.sut.getDetailResult().title, "Hard Kill")
      movieExpectation.fulfill()
    }
    waitForExpectations(timeout: 2, handler: nil)
  }
  
  func testGetDetailWithoutWifiDependency() {
    let genre = Genre(name: "myGenre")
    let movie = DetailModel(genres: [genre], poster_path: "dewd", release_date: "Today", runtime: 50, overview: "Thats just the way it is", title: "Marvel")
    let data = try? JSONEncoder().encode(movie)
    sut.getDetail(session: MockSession(data: data), urlString: "") {
      XCTAssertEqual(movie.runtime, 50)
    }
  }
  
  func testMoviesWithWrongString() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    let wrongURL = movieUrl + apiKey
    sut.getDetail(session: URLSession.shared, urlString: wrongURL) {
      XCTAssertEqual(self.sut.isThereData(), false)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testMoviesWhenErrorOccured() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    let wrongURL = apiKey + movieUrl
    sut.getDetail(urlString: wrongURL) {
      XCTAssertNotEqual(self.sut.getErrorMessage(), "")
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
}
