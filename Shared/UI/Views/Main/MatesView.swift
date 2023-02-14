//
//  MatesView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/02.
//

import SwiftUI

struct MatesView: View {
    
    @Environment(\.colorScheme) private var scheme
    @State private var isOpenSearchSheet : Bool = false
    
    var body : some View {
        VStack(
            alignment : HorizontalAlignment.leading,
            spacing: 0
        ){
            HStack(
                alignment : VerticalAlignment.center,
                spacing: 0
            ){
                LogoView(
                    setWidth: 200,
                    setHeight: 80,
                    setTint: Theme.trendYellow,
                    setOnClick: {
                        
                    }
                )
                
                Spacer()
                
                Image("icon_search")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fit)
                    .padding(5)
                    .foregroundColor(Theme.buttonColour(forScheme: scheme))
                    .frame(
                        width: 35,
                        height: 35
                    )
                    .onTapGesture {
                        isOpenSearchSheet = !isOpenSearchSheet
                    }
                    .sheet(
                        isPresented: $isOpenSearchSheet,
                        onDismiss: {
                            
                        },
                        content: {
                            VStack(
                                alignment : HorizontalAlignment.leading,
                                spacing: 0
                            ){
                                
                            }
                        }
                    )// imageview
            }//hstack
            
                
//            MatesCardListView()
        }
        .background(Theme.backgroundColour(forScheme: scheme))
        //VStack
    }
}

