//
//  ContentView.swift
//  FriendList
//
//  Created by Oleg Gavashi on 27.09.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var dataController = DataController()
    
    var body: some View {
        NavigationView {
            FriendsListView()
                .navigationTitle("FriendList")
        }
        .environment(\.managedObjectContext, dataController.container.viewContext)
        .onAppear {
            apiService().getUsers { users in
                users.forEach { user in
                    let newUser = CachedUser(context: dataController.container.viewContext)
                    newUser.id = user.id
                    newUser.name = user.name
                    newUser.about = user.about
                    newUser.address = user.address
                    newUser.age = Int16(user.age)
                    newUser.company = user.company
                    newUser.email = user.email
                    newUser.isActive = user.isActive
                    newUser.registered = user.registered
                    newUser.tags = user.tags.joined(separator: ", ")
                    
                    let cachedFriends = user.friends.map { friend in
                        let newFriend = CachedFriend(context: dataController.container.viewContext)
                        newFriend.id = friend.id
                        newFriend.name = friend.name
                        
                        return newFriend
                    }
                    
                    newUser.friends = NSSet(array: cachedFriends)
                                        
                    do {
                        try dataController.container.viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
