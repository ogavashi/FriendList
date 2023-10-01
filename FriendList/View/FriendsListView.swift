//
//  FriendsList.swift
//  FriendList
//
//  Created by Oleg Gavashi on 30.09.2023.
//

import SwiftUI

struct FriendsListView: View {
    @EnvironmentObject var state: AppState
    var body: some View {
        List {
            ForEach(state.users) { user in
             FriendRow(user: user)
            }
        }
    }
}

struct FriendsListView_Previews: PreviewProvider {
    static let state = AppState()
    
    static var previews: some View {
        FriendsListView()
            .environmentObject(state)
    }
}
