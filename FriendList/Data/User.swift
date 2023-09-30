//
//  User.swift
//  FriendList
//
//  Created by Oleg Gavashi on 30.09.2023.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
