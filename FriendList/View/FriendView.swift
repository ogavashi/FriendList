//
//  FriendView.swift
//  FriendList
//
//  Created by Oleg Gavashi on 01.10.2023.
//

import SwiftUI

struct FriendView: View {
    @EnvironmentObject var state: AppState
    
    let user: User
    var body: some View {
        VStack {
            Form {
                Section("Main information") {
                    ProfileRow(rowTitle: "Name", rowValue: user.name)
                    ProfileRow(rowTitle: "Age", rowValue: String(user.age))
                    ProfileRow(rowTitle: "Company", rowValue: user.company)
                    ProfileRow(rowTitle: "Active", rowValue: user.isActive ? "Yes" : "No")
                }
                Section("Details") {
                    ProfileRow(rowTitle: "Email", rowValue: user.email)
                    ProfileRow(rowTitle: "Address", rowValue: user.address)
                    ProfileRow(rowTitle: "Registred", rowValue: user.registered.formatted(date: .numeric, time: .omitted))
                }
                Section("Tags") {
                    Text(user.tags.joined(separator: ", "))
                }
                Section("About") {
                    Text(user.about)
                }
                
                if !user.friends.isEmpty && !state.users.isEmpty {
                    Section("Friends") {
                        List {
                            ForEach(user.friends) { rawFriend in
                                let friend = state.users.first(where: { stateUser in
                                    stateUser.id == rawFriend.id
                                })
                                if let friend = friend {
                                    FriendRow(user: friend)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(user.name)
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendView(user: User(id: "123", isActive: true, name: "Test Name", age: 89, company: "Arasaka", email: "johnysilverhand@email.com", address: "Night City", about: "Rebel rock musician", registered: Date(), tags: ["Rebel", "Samurai", "Night City"], friends: [Friend(id: "123", name: "V")]))
            .environmentObject(AppState())
    }
}
