//
//  PopularMoviesTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Kingsley Enoka on 11/5/20.
//  Copyright © 2020 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

class PopularMoviesTests: XCTestCase {
  
  var sut: PopularVM!
  
  override func setUp(){
    super.setUp()
    sut = PopularVM()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  // MARK: - Poplular Movies Test
  func testNumberOfPopularMoviesBeforeAPICall() {
    let nuberOfNowPlayingM = sut.getNumberOfMovies()
    XCTAssertEqual(nuberOfNowPlayingM, 0)
  }
  
  func testNumberOfPopularMAfterAPICall() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    sut.fetchPopularMovies {
      XCTAssertNotEqual(self.sut.getNumberOfMovies(), 0)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testPopularMoviesWithEmptyString() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    sut.fetchPopularMovies(session: URLSession.shared, urlString: "") {
      XCTAssertEqual(self.sut.getNumberOfMovies(), 0)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testPopularMoviesWithWrongString() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    let wrongURL = movieUrl + apiKey
    sut.fetchPopularMovies(session: URLSession.shared, urlString: wrongURL) {
      XCTAssertEqual(self.sut.getNumberOfMovies(), 0)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testPopularMoviesWhenErrorOccured() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    let wrongURL = apiKey + movieUrl
    sut.fetchPopularMovies(session: URLSession.shared, urlString: wrongURL) {
      XCTAssertNotEqual(self.sut.getErrorMessage(), "")
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testGetPopularAfterAPICall() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    sut.fetchPopularMovies {
      XCTAssertEqual(self.sut.getMovie(at: 0).id, 724989)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testTotalResult() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    sut.fetchPopularMovies {
      XCTAssertEqual(self.sut.getTotalResult(), 10000)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testNumberOfPopularMoviesWithoutWifiDependency() {
    let movieOne = PopularResult(poster_path: "dewde", id: 1, title: "Marvel", vote_average: 3.0, release_date: "Today")
    let movieTwo = PopularResult(poster_path: "dewddee", id: 2, title: "Marvel 2", vote_average: 4.0, release_date: "Tomorrow")
    let movieContainer = PopularModel(total_results: 2, results: [movieOne, movieTwo])
    let data = try? JSONEncoder().encode(movieContainer)
    sut.fetchPopularMovies(session: MockSession(data: data)) {
      XCTAssertEqual(self.sut.getNumberOfMovies(), 2)
    }
  }
  
  func testGetPopularMoviesWithoutWifiDependency() {
    let movieOne = PopularResult(poster_path: "dewde", id: 1, title: "Marvel", vote_average: 3.0, release_date: "Today")
    let movieTwo = PopularResult(poster_path: "dewddee", id: 2, title: "Marvel 2", vote_average: 4.0, release_date: "Tomorrow")
    let movieContainer = PopularModel(total_results: 2, results: [movieOne, movieTwo])
    let data = try? JSONEncoder().encode(movieContainer)
    sut.fetchPopularMovies(session: MockSession(data: data)) {
      XCTAssertNotEqual(self.sut.getMovie(at: 0).id, nil)
    }
  }
  
}
