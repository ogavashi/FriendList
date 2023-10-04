//
//  FriendsList.swift
//  FriendList
//
//  Created by Oleg Gavashi on 30.09.2023.
//

import SwiftUI

struct FriendsListView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    var body: some View {
        List {
            ForEach(users) { user in
             FriendRow(user: user)
            }
        }
    }
}

