//
//  State.swift
//  FriendList
//
//  Created by Oleg Gavashi on 01.10.2023.
//

import Foundation

class AppState: ObservableObject {
    @Published var users = [User]()
}
