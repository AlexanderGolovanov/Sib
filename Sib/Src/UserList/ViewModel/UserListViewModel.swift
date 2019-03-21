//
//  UserListViewModel.swift
//  Sib
//
//  Created by Alexander Golovanov on 21/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import Foundation

class UserListViewModel {
    private var userViewModels: [UserViewModel]
    
    init(userViewModels: [UserViewModel]) {
        self.userViewModels = userViewModels
    }
    
    func getNumberOfUserModels() -> Int {
        return userViewModels.count
    }
    
    func getUserModel(row: Int) -> UserViewModel? {
        if row < userViewModels.count {
            return userViewModels[row]
        }
        return nil
    }
}
