//
//  CS_iOS_AssignmentUITests.swift
//  CS_iOS_AssignmentUITests
//
//  Created by Vipul Shah on 23/12/2019.
//  Copyright © 2019 Backbase. All rights reserved.
//

import XCTest
@testable import CS_iOS_Assignment

class CS_iOS_AssignmentUITests: XCTestCase {
  
  var app: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    continueAfterFailure = false
    app = XCUIApplication()
    app.launchArguments.append("--uitesting")
  }
  
  override func tearDown() {
    app = nil
    super.tearDown()
  }
  
  func testCollectionViewDidSelect() {
    app.launch()
    app.collectionViews.cells.element(boundBy: 0).tap()
  }
  
  func testTableViewDidSelect() {
    app.launch()
    app.tables.cells.element(boundBy: 0).tap()
  }
  
  func testTableViewWithInfiniteScroll() {
    app.launch()
    let newCell = app.staticTexts["Coco"]
    XCTAssertFalse(newCell.exists)

    app.tables.element.swipeUp()
    app.tables.element.swipeUp()
    app.tables.element.swipeUp()
    app.tables.element.swipeUp()
    app.tables.element.swipeUp()
    XCTAssert(newCell.exists)
  }
  
  
  // MARK: - Detail ViewController
  func testCancelButton() {
    app.launch()
    app.collectionViews.cells.element(boundBy: 0).tap()
    app.buttons.element.tap()
  }
  
}
