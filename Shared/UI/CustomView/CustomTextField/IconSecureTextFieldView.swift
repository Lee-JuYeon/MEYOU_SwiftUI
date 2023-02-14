//
//  IconSecureTextFieldView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/01.
//

import SwiftUI

struct IconSecureTextFieldView: View {
    
    @Binding private var getPW : String
    private var getPWHint : LocalizedStringKey
    
    init(
        setPW : Binding<String>,
        setPWHint : LocalizedStringKey
    ){
        self._getPW = setPW
        self.getPWHint = setPWHint
    }
    
    @State private var isHide : Bool = false


    var body: some View {
        HStack(
            alignment : VerticalAlignment.center
        ){
            Image(isHide == true ? "icon_pw_lock_off" : "icon_pw_lock_on")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .clipped()
                .padding(EdgeInsets( top: 0, leading: 10, bottom: 0, trailing: 0))
                .onTapGesture {
                    isHide = !isHide
                }
            
            if isHide == true {
                TextField(
                    getPWHint,
                    text: $getPW
                )
                .padding(.all, 10)
                .cornerRadius(10)
            }else {
                SecureField(
                    getPWHint,
                    text: $getPW
                )
                .padding(.all, 10)
                .cornerRadius(10)
            }
            
            
        }
        .border(Color.black, width: 1)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
        )

    }
}
