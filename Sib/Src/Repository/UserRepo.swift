//
//  UserRepo.swift
//  Sib
//
//  Created by Alexander Golovanov on 21/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import Foundation

class UserRepo {
    static func getUsers() -> [User] {
        return [User(name: "Иван Иванов", photoURL: "ivanov.png", rating: [4,2,3,4]),
                User(name: "Шерлок Холмс", photoURL: "https://upload.wikimedia.org/wikipedia/commons/0/0f/Benedict_Cumberbatch_filming_Sherlock_cropped2.jpg", rating: [5,5,5,4]),
                User(name: "Карабас Барабас", photoURL: "karabas-barabs.png", rating: [3,2,2,3]),
                User(name: "Винни Пух", photoURL: "winnie.png", rating: [5,5,5,5])]
    }
}
