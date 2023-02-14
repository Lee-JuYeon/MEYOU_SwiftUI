//
//  NameGenderView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/14.
//

import SwiftUI

struct NameGenderView: View {
    @Binding private var getText : String
    @Binding private var getGender : Gender
    
    init(
        setText : Binding<String>,
        setGender : Binding<Gender>
    ){
        self._getText = setText
        self._getGender = setGender
    }

    @Environment(\.colorScheme) private var scheme

    var body: some View {
        HStack(
            alignment : VerticalAlignment.center
        ){
            PlaceHolderTextfield(
                setText: $getText,
                setTextColour: Color.black,
                setHint: LocalizedStringKey("userNameHint"),
                setHintColour: Theme.hintColour(forScheme: scheme),
                setBackgroundColour: .clear,
                setCornerRadius: 0,
                setKeyboardType: .namePhonePad
            )
             
            GenderToggleView(setGender: $getGender)
        }
        .padding(10)
        .background(Theme.textFieldBackgroundColour(forScheme: scheme))
        .cornerRadius(10)
//        .overlay(
//        )
    }
}
