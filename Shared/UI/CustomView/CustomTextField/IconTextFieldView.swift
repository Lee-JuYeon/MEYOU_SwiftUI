//
//  IconTextFieldView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/01.
//

import SwiftUI

struct IconTextFieldView: View {
    
    @Binding private var getText : String
    private var getHint : LocalizedStringKey
    private var getImage : String
    
    init(
        setText : Binding<String>,
        setHint : LocalizedStringKey,
        setImage : String
    ){
        self._getText = setText
        self.getHint = setHint
        self.getImage = setImage
    }

    var body: some View {
        HStack(
            alignment : VerticalAlignment.center
        ){
            Image(getImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .clipped()
                .padding(EdgeInsets( top: 0, leading: 10, bottom: 0, trailing: 0))
            
            TextField(
                getHint,
                text: $getText
            )
            .padding(.all, 10)
//            .background(Color.transparent)
//            .border(Color.red, width: 1)
            .cornerRadius(10)
            
        }
        .border(Color.black, width: 1)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )

    }
}

