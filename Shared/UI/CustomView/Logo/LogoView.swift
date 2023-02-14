//
//  LogoView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/02.
//

import SwiftUI

struct LogoView: View {
    
    private var getWidth : CGFloat
    private var getHeight : CGFloat
    private var getTint : Color
    private var onClick : () -> Void?
    init(
        setWidth : CGFloat?,
        setHeight : CGFloat?,
        setTint : Color,
        setOnClick : @escaping () -> Void?
    ){
        self.getWidth = setWidth ?? 200
        self.getHeight = setHeight ?? 80
        self.getTint = setTint
        self.onClick = setOnClick
    }
    
    @Environment(\.colorScheme) private var scheme
    
    var body: some View {
        Image("logo_text")
            .renderingMode(.template)
            .foregroundColor(
                getTint
            )
            .onTapGesture {
                onClick()
            }
    }
}

