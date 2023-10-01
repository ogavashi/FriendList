//
//  FriendRow.swift
//  FriendList
//
//  Created by Oleg Gavashi on 01.10.2023.
//

import SwiftUI

struct FriendRow: View {
    let user: User
    var body: some View {
        NavigationLink {
            FriendView(user: user)
        } label: {
            HStack {
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                
                Text(user.company)
            }
        }
    }
}
