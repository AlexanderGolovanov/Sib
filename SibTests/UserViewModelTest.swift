//
//  UserViewModelTest.swift
//  SibTests
//
//  Created by Alexander Golovanov on 22/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import XCTest
@testable import Sib

class UserViewModelTest: XCTestCase {
    
    var viewModel: UserViewModel!
    
    override func setUp() {
        super.setUp()
        let user = User(name: "Тест тест", photoURL: "https://dpchas.com.ua/sites/default/files/u85/16_39.jpg", rating: [1,1,1,1])
        self.viewModel = UserViewModel(user: user)
    }

    override func tearDown() {
        self.viewModel = nil
        super.tearDown()
    }

    func testFirstName() {
        guard let _ = viewModel.firstName else {
            XCTAssert(false, "FirstName is nil")
            return
        }
    }

    func testLastName() {
        guard let _ = viewModel.lastName else {
            XCTAssert(false, "LastName is nil")
            return
        }
    }
    
    func testLoadImage() {
        let expectation = XCTestExpectation(description: "Loading image")
        viewModel.loadPhoto { (result) in
            switch result {
            case .success( _): break
            case .failure( _): XCTAssert(false, "Image loading error")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testRating() {
        guard let _ = viewModel.rating else {
            XCTAssert(false, "not enough data for rating")
            return
        }
    }
}
