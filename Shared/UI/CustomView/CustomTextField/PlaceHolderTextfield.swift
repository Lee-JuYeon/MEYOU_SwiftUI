//
//  PlaceHolderTextfield.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/19.
//

import SwiftUI

struct PlaceHolderTextfield : View {
    
    @Environment(\.colorScheme) var scheme
    
    @Binding private var text : String
    private var textColour : Color
    private var hint : LocalizedStringKey
    private var hintColour : Color
    private var backgroundColour : Color?
    private var cornerRadius : CGFloat?
    private var keyboardType : UIKeyboardType?
    
    init(
        setText : Binding<String>,
        setTextColour : Color,
        setHint : LocalizedStringKey,
        setHintColour : Color,
        setBackgroundColour : Color?,
        setCornerRadius : CGFloat?,
        setKeyboardType : UIKeyboardType?
    ){
        self._text = setText
        self.textColour = setTextColour
        self.hint = setHint
        self.hintColour = setHintColour
        
        self.backgroundColour = setBackgroundColour
        self.cornerRadius = setCornerRadius
        self.keyboardType = setKeyboardType
    }
    

    
    var body: some View {
        ZStack(
            alignment : Alignment.leading
        ){
            if text == "" {
                Text(hint)
                    .foregroundColor(hintColour)
            }
            
            TextField(
                "",
                text: $text
            ).foregroundColor(textColour)
            .keyboardType(keyboardType ?? .default)
            .multilineTextAlignment(.leading)
        }.padding(cornerRadius ?? 10)
         .background(backgroundColour ?? Theme.textFieldBackgroundColour(forScheme: scheme))
         .cornerRadius(cornerRadius ?? 10)
    }
}
