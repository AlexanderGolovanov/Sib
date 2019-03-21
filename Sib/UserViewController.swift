//
//  ViewController.swift
//  Sib
//
//  Created by Alexander Golovanov on 21/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    public var userViewModel: UserViewModel!
    @IBOutlet weak var userView: UserView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userView.configure(userViewModel: userViewModel)
    }
}

