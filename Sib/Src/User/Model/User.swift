//
//  User.swift
//  Sib
//
//  Created by Alexander Golovanov on 21/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import Foundation

struct User {
    public let name: String
    public let photoURL: String
    public let rating: [Int]

    init(name: String, photoURL: String, rating: [Int]) {
        self.name = name
        self.photoURL = photoURL
        self.rating = rating
    }
}
