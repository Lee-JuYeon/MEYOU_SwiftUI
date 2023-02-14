//
//  BioChipsView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/16.
//

import SwiftUI

struct BioChipsView: View {
    
    @Binding private var bio : String
    
    init(
        setBio : Binding<String>
    ){
        self._bio = setBio
    }
    

    var body: some View {
        VStack(
            alignment : HorizontalAlignment.leading,
            spacing : 0
        ){
            PlaceHolderTextEditor(
                setHint: LocalizedStringKey("bioHint"),
                setText: $bio
            )
            
            ChipView()
        }
    }
}
