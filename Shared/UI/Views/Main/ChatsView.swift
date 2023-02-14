//
//  ChatsView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/02.
//

import SwiftUI

struct ChatsView: View {
    @Environment(\.colorScheme) private var scheme

    var body : some View {
        Text("ChatsView")
            .background(Theme.backgroundColour(forScheme: scheme))
    }
}
