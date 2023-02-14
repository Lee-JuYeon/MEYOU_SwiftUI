//
//  ProfileView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/02.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) private var scheme

    var body : some View {
        Text("ProfileView")
            .background(Theme.backgroundColour(forScheme: scheme))
    }
}

