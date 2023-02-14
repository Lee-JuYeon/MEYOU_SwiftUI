//
//  ForgetPasswordView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI

struct ForgetPasswordView: View {
    
    private var onClick : () -> Void
    
    init(
        setOnClick : @escaping () -> Void
    ){
        self.onClick = setOnClick
    }
    
    @Environment(\.colorScheme) var scheme
    private let forgetPW : LocalizedStringKey = "forgetPW"

    var body: some View {
        Text(forgetPW)
            .font(.system(size: 15))
            .padding(5)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 65
            )
            .foregroundColor(Theme.textColour(forScheme: scheme))
            .onTapGesture {
                onClick()
            }
    }
}

