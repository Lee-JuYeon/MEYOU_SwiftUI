//
//  PasswordTextfieldView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/09.
//

import SwiftUI

struct PasswordTextfieldView: View {
    @Environment(\.colorScheme) var scheme
    @Binding private var getText : String
    
    init(
        setText : Binding<String>
    ){
        self._getText = setText
    }

    private let getHint : LocalizedStringKey = "pwHint"
    @State private var isHide : Bool = false

    var body: some View {
        HStack(
            alignment : VerticalAlignment.center
        ){
            Text(isHide == true ? "🔓" : "🔒")
                .font(.system(size: 20))
                .padding(EdgeInsets( top: 0, leading: 10, bottom: 0, trailing: 0))
                .onTapGesture {
                    isHide = !isHide
                }

            ZStack(
                alignment : Alignment.leading
            ){
                if getText == "" {
                    Text(getHint)
                        .foregroundColor(Color.black.opacity(0.5))
                        .padding(.all, 10)
                }
                
                if isHide == true {
                    TextField(
                        "",
                        text: $getText
                    )
                    .foregroundColor(Color.black)
                    .padding(.all, 10)
                    .cornerRadius(10)
                }else {
                    SecureField(
                        "",
                        text: $getText
                    )
                    .foregroundColor(Color.black)
                    .padding(.all, 10)
                    .cornerRadius(10)
                }
            }
        }
        .padding(10)
        .background(Theme.textFieldBackgroundColour(forScheme: scheme))
        .cornerRadius(10)
    }
}
