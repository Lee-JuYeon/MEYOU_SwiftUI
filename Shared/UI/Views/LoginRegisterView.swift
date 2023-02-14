//
//  LoginView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI

struct LoginRegisterView : View {
    @State private var pageViewCurrentIndex = 0
    
    @State private var getEmail : String = ""
    @State private var getPW : String = ""
    @State private var currentPage : Int = 0
    
    @Environment(\.colorScheme) var scheme

    var body : some View {
        PageView(
            setWidth: UIScreen.main.bounds.width,
            setHeight: UIScreen.main.bounds.height,
            setPageCount: 2,
            setScrollable: false,
            setCurrentIndex: $currentPage,
            setBackground: {
                Theme.backgroundColour(forScheme: scheme)
            },
            setContent: {
                // 로그인 뷰
                LoginView()
                
                // 계정 생성 뷰
                RegisterView()
                
                // 비밀번호 찾는 뷰
                
            }
        )
    }
}
