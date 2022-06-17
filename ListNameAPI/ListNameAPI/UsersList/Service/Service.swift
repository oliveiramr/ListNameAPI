//
//  Service.swift
//  ListNameAPI
//
//  Created by Murilo Ribeiro de Oliveira on 17/06/22.
//https://jsonplaceholder.typicode.com/users

import Foundation

enum NetworkingError : Error {
    case wrongURL
    case wrongModel
    case generic
}


class Service {
    
    private let usersURL = "https://jsonplaceholder.typicode.com/users/"
    
    func getUser(completion: @escaping (Result<[User], NetworkingError>) -> Void) {
        guard let url = URL(string: usersURL) else {
            completion(.failure(.wrongURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error != nil {
                    completion(.failure(.generic))
                    return
                }
                guard let data = data else {
                    completion(.failure(.generic))
                    return
                }
                
                guard let user = try? JSONDecoder().decode([User].self, from: data) else {
                    completion(.failure(.wrongModel))
                    return
                }
                completion(.success(user))
            }
        }
        task.resume()
    }
    
    
}
