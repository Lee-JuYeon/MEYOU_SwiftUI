//
//  RegisterButtonView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/09.
//

import SwiftUI

struct RegisterButtonView: View {
    private var onClick : () -> Void
    
    init(
        setOnClick : @escaping () -> Void
    ){
        self.onClick = setOnClick
    }
    
    @Environment(\.colorScheme) var scheme
    private let register : LocalizedStringKey = "register"

    var body: some View {
        Text(register)
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
