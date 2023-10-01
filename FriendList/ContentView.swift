//
//  ContentView.swift
//  FriendList
//
//  Created by Oleg Gavashi on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var state = AppState()
    var body: some View {
        NavigationView {
            FriendsListView()
                .navigationTitle("FriendList")
        }
        .environmentObject(state)
        .onAppear {
            apiService().getUsers { users in
                state.users = users
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
