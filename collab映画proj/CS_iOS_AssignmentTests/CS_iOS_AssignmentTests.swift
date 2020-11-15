//
//  CS_iOS_AssignmentTests.swift
//  CS_iOS_AssignmentTests
//
//  Created by Vipul Shah on 23/12/2019.
//  Copyright © 2019 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

class CS_iOS_AssignmentTests: XCTestCase {
  
  var sut: MovieService!
  
  override func setUp() {
    super.setUp()
    sut = MovieService()
  }
  
  override func tearDown() {
    sut = nil
    super.tearDown()
  }
  
  // MARK: - Now Playing Movies Tests
  func testNumberOfNowPlayingMoviesBeforeAPICall() {
    let nuberOfNowPlayingM = sut.getNumberOfMovies()
    XCTAssertEqual(nuberOfNowPlayingM, 0)
  }
  
  func testNumberOfNowPlayingMAfterAPICall() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    sut.fetchMovies {
      XCTAssertEqual(self.sut.getNumberOfMovies(), 20)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testNowMoviesWithEmptyString() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    sut.fetchMovies(session: URLSession.shared, urlString: "") {
      XCTAssertEqual(self.sut.getNumberOfMovies(), 0)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testNowMoviesWithWrongString() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    let wrongURL = movieUrl + apiKey
    sut.fetchMovies(session: URLSession.shared, urlString: wrongURL) {
      XCTAssertEqual(self.sut.getNumberOfMovies(), 0)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testNowMoviesWhenErrorOccured() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    let wrongURL = apiKey + movieUrl
    sut.fetchMovies(session: URLSession.shared, urlString: wrongURL) {
      XCTAssertNotEqual(self.sut.getErrorMessage(), "")
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testGetNowPlayingMoviesAfterAPICall() {
    let moviesExpectation = expectation(description: "Wait for API Call")
    sut.fetchMovies {
      XCTAssertEqual(self.sut.getMovie(at: 0).id, 724989)
      moviesExpectation.fulfill()
    }
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func testNumberOfMoviesWithoutWifiDependency() {
    let movieOne = Results(poster_path: "ghvgh", id: 1)
    let movieTwo = Results(poster_path: "ghxsvgh", id: 2)
    let movieContainer = NowPlayingModel(results: [movieOne, movieTwo])
    let data = try? JSONEncoder().encode(movieContainer)
    sut.fetchMovies(session: MockSession(data: data)) {
      XCTAssertEqual(self.sut.getNumberOfMovies(), 2)
    }
  }
  
  func testGetMovieWithoutWifiDependency() {
    let movieOne = Results(poster_path: "ghvgh", id: 1)
    let movieTwo = Results(poster_path: "ghxsvgh", id: 2)
    let movieContainer = NowPlayingModel(results: [movieOne, movieTwo])
    let data = try? JSONEncoder().encode(movieContainer)
    sut.fetchMovies(session: MockSession(data: data)) {
      XCTAssertNotEqual(self.sut.getMovie(at: 1).id, nil)
    }
  }
}

struct MockSession: Session {
  let data: Data?
  
  func getData(from url: URL, completion: ((Data?, URLResponse?, Error?) -> Void)?) {
    completion?(data, nil, nil)
  }
}
