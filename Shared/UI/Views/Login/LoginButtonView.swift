//
//  LoginButtonView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/09.
//

import SwiftUI

struct LoginButtonView: View {
    
    private var onClick : () -> Void
    
    init(
        setOnClick : @escaping () -> Void
    ){
        self.onClick = setOnClick
    }
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        Text("LOG IN")
            .font(.system(
                size: 30,
                weight: .heavy,
                design: .default
            ))
            .padding(5)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: 70,
                alignment: Alignment.center
            )
            .background(
                Theme.buttonColour(forScheme: scheme)
            )
            .cornerRadius(10)
            .onTapGesture {
                onClick()
            }
    }
}
