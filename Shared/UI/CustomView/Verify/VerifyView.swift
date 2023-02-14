//
//  AuthView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI

struct VerifyView : View {
    
    let langStrForwardText = String(
        Locale.preferredLanguages[0].prefix(2)
    )
    
    var body: some View {
        switch langStrForwardText {
        case "en" :
            Text("왓츠앱으로 인증")
                .onTapGesture {
                    print("en \(langStrForwardText)")
                }
        case "ko" :
            Text("카카오톡으로 인증")
                .onTapGesture {
                    print("kr \(langStrForwardText)")
                }
        case "ja" :
            Text("라인으로 인증")
                .onTapGesture {
                    print("ja \(langStrForwardText)")
                }
        case "es" :
            Text("왓츠앱으로 인증")
                .onTapGesture {
                    print("es \(langStrForwardText)")
                }
        default :
            Text("왓츠앱으로 인증")
                .onTapGesture {
                    print("en \(langStrForwardText)")

                }
        }
    }
}

