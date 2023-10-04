//
//  FriendView.swift
//  FriendList
//
//  Created by Oleg Gavashi on 01.10.2023.
//

import SwiftUI

struct FriendView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<CachedUser>
    
    let user: CachedUser
    
    var body: some View {
        VStack {
            Form {
                Section("Main information") {
                    ProfileRow(rowTitle: "Name", rowValue: user.name ?? "Unknown name")
                    ProfileRow(rowTitle: "Age", rowValue: String(user.age))
                    ProfileRow(rowTitle: "Company", rowValue: user.company ?? "Unknown company")
                    ProfileRow(rowTitle: "Active", rowValue: user.isActive ? "Yes" : "No")
                }
                Section("Details") {
                    ProfileRow(rowTitle: "Email", rowValue: user.email ?? "Unknown email")
                    ProfileRow(rowTitle: "Address", rowValue: user.address ?? "Unknown address")
                    ProfileRow(rowTitle: "Registered", rowValue: user.registered?.formatted(date: .numeric, time: .omitted) ?? "Unknown date")
                }
                Section("Tags") {
                    Text(user.tags ?? "Unknown tags")
                }
                Section("About") {
                    Text(user.about ?? "Unknown information")
                }
                if let friends = fetchFriends(forUser: user) {
                    Section("Friends") {
                        List(friends, id: \.id) { friend in
                            if let localFriend = users.first(where: { $0.id == friend.id }) {
                                FriendRow(user: localFriend)
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(user.name ?? "Unknown user")
        }
    }
    
    func fetchFriends(forUser user: CachedUser) -> [CachedFriend]? {
        user.friends?.allObjects.compactMap { $0 as? CachedFriend }
    }
}
