//
//  UsersViewModel.swift
//  Sib
//
//  Created by Alexander Golovanov on 21/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import UIKit
import Foundation

enum ImageNetworkResult {
    case success(UIImage)
    case failure(Error?)
}

class UserViewModel {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    public var name: String {
        return user.name
    }
    
    public var firstName: String? {
        if !user.name.isEmpty, let first = user.name.split(separator: " ").first {
            return String(first)
        }
        return nil
    }
    
    public var lastName: String? {
        if !user.name.isEmpty, let last = user.name.split(separator: " ").last {
            return String(last)
        }
        return nil
    }
    
    public var photoURL: String {
        return user.photoURL
    }
    
    public var rating: Double? {
        let rating = user.rating.prefix(4)
        if rating.isEmpty || rating.count < 4 { return nil }
        let sum = rating.reduce(0, +)
        return Double(sum/rating.count)
    }
    
    public func loadPhoto(completion: @escaping ((ImageNetworkResult) -> Void)) {
        guard let url = URL(string: user.photoURL) else { return }
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                if let image = UIImage(data: data) {
                    completion(.success(image))
                }
            }
            catch {
                completion(.failure(error))
            }
        }
    }
}
