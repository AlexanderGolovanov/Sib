//
//  UserListViewController.swift
//  Sib
//
//  Created by Alexander Golovanov on 21/03/2019.
//  Copyright © 2019 Alexander Golovanov. All rights reserved.
//

import UIKit

class UserListViewController: UITableViewController {
    
    private var viewModel: UserListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let users = UserRepo.getUsers().map { UserViewModel(user: $0) }
        viewModel = UserListViewModel(userViewModels: users)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfUserModels() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCellReuseId", for: indexPath)
        if let vm = viewModel?.getUserModel(row: indexPath.row) {
            cell.textLabel?.text = vm.firstName
            cell.detailTextLabel?.text = vm.lastName
        }
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let controller = segue.destination as? UserViewController,
            let indexPath = tableView.indexPathForSelectedRow,
            let vm = viewModel?.getUserModel(row: indexPath.row) {
            controller.userViewModel = vm
        }
    }
}
