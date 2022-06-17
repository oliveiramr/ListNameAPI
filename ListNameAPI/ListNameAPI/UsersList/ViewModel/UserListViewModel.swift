//
//  UserListViewModel.swift
//  ListNameAPI
//
//  Created by Murilo Ribeiro de Oliveira on 17/06/22.
//

import Foundation

protocol UserListViewModelDelegate: AnyObject {
    func didGetUserList()
}

class UserListViewModel {
    
    weak var delegate: UserListViewModelDelegate?
   
    private let service = Service()
    
    private(set) var listUser : [User] = []
    
    func getUsersList(){
        service.getUser{ (users: Result<[User], NetworkingError>) in
                switch users {
                case .success(let users):
                   
                    self.listUser = users
                    
                    self.delegate?.didGetUserList()
                    
                    print(users)
                case.failure(let error):
                    print(error)
            
            }
        }
                            
    }
    
}
