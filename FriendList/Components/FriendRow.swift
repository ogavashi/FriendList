//
//  FriendRow.swift
//  FriendList
//
//  Created by Oleg Gavashi on 01.10.2023.
//

import SwiftUI

struct FriendRow: View {
    let user: CachedUser
    var body: some View {
        NavigationLink {
            FriendView(user: user)
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(user.name ?? "Unknown name")
                        .font(.headline)
                    Text(user.email ?? "Unknown email")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                
                Text(user.company ?? "Unknown company")
            }
        }
    }
}
