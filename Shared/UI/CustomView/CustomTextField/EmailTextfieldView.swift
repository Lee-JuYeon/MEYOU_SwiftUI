//
//  EmailTextfieldView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/09.
//

import SwiftUI

struct EmailTextfieldView : View {
    
    @Environment(\.colorScheme) var scheme
    @Binding private var getText : String
    
    init(
        setText : Binding<String>
    ){
        self._getText = setText
    }

    private let getHint : LocalizedStringKey = "emailHint"

    var body: some View {
        HStack(
            alignment : VerticalAlignment.center
        ){
            Text("✉️")
                .font(.system(size: 20))
                .padding(EdgeInsets( top: 0, leading: 10, bottom: 0, trailing: 0))

            ZStack(
                alignment : Alignment.leading
            ){
                if getText == "" {
                    Text(getHint)
                        .foregroundColor(Color.black.opacity(0.5))
                        .padding(.all, 10)
                }
                
                TextField(
                    "",
                    text: $getText
                )
                .foregroundColor(Color.black)
                .padding(.all, 10)
                .cornerRadius(10)
                .keyboardType(.emailAddress)
            }
        }
        .padding(10)
        .background(Theme.textFieldBackgroundColour(forScheme: scheme))
        .cornerRadius(10)
    }
}

