//
//  PlaceHolderTextEditor.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/20.
//

import SwiftUI

struct PlaceHolderTextEditor: View {
    
    @Binding private var text : String
    private var hint : LocalizedStringKey = ""
    
    init(
        setHint : LocalizedStringKey,
        setText : Binding<String>
    ){
        self.hint = setHint
        self._text = setText
    }

    @Environment(\.colorScheme) private var scheme

    var body: some View {
        ZStack(
            alignment : Alignment.topLeading
        ){
            if text == "" {
                Text(hint)
                    .foregroundColor(Color.black.opacity(0.6))
                    .multilineTextAlignment(.leading)
            }
            
            TextEditor(text: $text)
                .onChange(of: text, perform: { newValue in
                    // 200글자 제한
                    if text.count > 200 {
                        text.removeLast()
                    }
                })
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    idealHeight: 200,
                    maxHeight: .infinity,
                    alignment: .topLeading
                )
                .foregroundColor(Color.black)
                .multilineTextAlignment(.leading)
        }
        .padding(10)
        .background(Theme.textFieldBackgroundColour(forScheme: scheme))
        .cornerRadius(10)
    }
}
