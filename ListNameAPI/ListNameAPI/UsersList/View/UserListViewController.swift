//
//  ViewController.swift
//  ListNameAPI
//
//  Created by Murilo Ribeiro de Oliveira on 17/06/22.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var usersListTableView: UITableView!
 
    let viewModel = UserListViewModel()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersListTableView.dataSource = self
        viewModel.delegate = self
        viewModel.getUsersList()
    }


}


extension UserListViewController :  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.listUser.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel.listUser[indexPath.row].name
      
        return cell
    }
    

    
}

extension UserListViewController :UserListViewModelDelegate {
    func didGetUserList() {
        usersListTableView.reloadData()
    }
    
}
