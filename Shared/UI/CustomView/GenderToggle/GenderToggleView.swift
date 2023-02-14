//
//  GenderToggleView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/15.
//

import SwiftUI

struct GenderToggleView: View {
    
    @Binding private var getGender : Gender
    
    init(
        setGender : Binding<Gender>
    ){
        self._getGender = setGender
    }
    
    @Environment(\.colorScheme) private var scheme
    private let toggleHeight : CGFloat = 25
    private let toggleWidth : CGFloat = 50
    
    var body: some View {
        ZStack(){
            RoundedRectangle(cornerRadius: toggleHeight/2)
                .fill(Color.purple)
                .frame(
                    width: toggleWidth,
                    height: toggleHeight
                )
                .overlay(
                    RoundedRectangle(cornerRadius: toggleHeight/2)
                        .strokeBorder(
                            RadialGradient(
                                gradient: Gradient(
                                    colors: [
                                        Color.black.opacity(0),
                                        Color.black.opacity(0.2)
                                    ]
                                ),
                                center: UnitPoint(x: 0.5, y: 0.5),
                                startRadius: 0,
                                endRadius: toggleWidth/2)
                        )
                        .frame(
                            width: toggleWidth,
                            height: toggleHeight
                        )
                )
            
            Circle()
                .fill(Color.white)
                .padding(2)
                .frame(
                    width: toggleWidth/2,
                    height: toggleHeight
                )
                .overlay(
                    Image(getGender == .MALE ? "icon_male" : "icon_female")
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(getGender == .MALE ? Color.blue : .red)
                        .padding(toggleWidth/10)
                )
                .shadow(
                    color: Theme.shadowColour(forScheme: scheme),
                    radius: 3,
                    x: 2,
                    y: 2
                )
                .offset(
                    CGSize(
                        width : getGender != .MALE ? toggleWidth/4 : -toggleWidth/4,
                        height : 0
                    )
                )
        }
        .frame(
            width: toggleWidth,
            height: toggleHeight
        )
        .onTapGesture {
            switch getGender {
            case .MALE :
                getGender = .FEMALE
                break
            case .FEMALE :
                getGender = .MALE
                break
            }
        }
        
    }
}
