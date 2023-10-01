//
//  ProfileRow.swift
//  FriendList
//
//  Created by Oleg Gavashi on 01.10.2023.
//

import SwiftUI

struct ProfileRow: View {
    let rowTitle: String
    let rowValue: String
    
    var body: some View {
        HStack {
            Text("\(rowTitle):")
                .bold()
                .font(.headline)
            Text(rowValue)
        }
    }
}
