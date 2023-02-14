//
//  MainView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI

struct MainView : View {
    
    private let iconSize : CGFloat = 10
    @State var selectedIndex: Int = 0

    @ViewBuilder
    func getTabView(pageIndex : Int) -> some View {
        switch pageIndex {
        case 0:
            MatesView()
        case 1:
            ChatsView()
        case 2:
            ProfileView()
        default:
            MatesView()
        }
    }
    

    var body : some View {
        CustomTabView(
            selectedIndex: $selectedIndex
        ) { index in
            getTabView(pageIndex: selectedIndex)
        }
    }
}
