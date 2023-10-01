//
//  apiService.swift
//  FriendList
//
//  Created by Oleg Gavashi on 30.09.2023.
//

import Foundation

class apiService {
    func getUsers(completion:@escaping ([User]) -> ()) {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let users = try! decoder.decode([User].self, from: data!)
            
            DispatchQueue.main.async {
                completion(users)
            }
        }
        .resume()
    }
}
