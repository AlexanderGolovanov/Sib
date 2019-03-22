//
//  UserListViewModelTest.swift
//  SibTests
//
//  Created by Alexander Golovanov on 22/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import XCTest
@testable import Sib

class UserListViewModelTest: XCTestCase {

    var viewModel: UserListViewModel!
    
    override func setUp() {
        super.setUp()
        let users = UserRepo.getUsers().map { UserViewModel(user: $0) }
        viewModel = UserListViewModel(userViewModels: users)
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testNonEmptyUsers() {
        if viewModel.getNumberOfUserModels() == 0 {
            XCTAssert(false, "No users in datasource")
        }
    }
    
    func testValueCell() {
        let indexPath = IndexPath(row: 0, section: 0)
        guard let _ = viewModel.getUserModel(row: indexPath.row) else {
            XCTAssert(false, "UserViewModel exist")
            return
        }
    }
}
