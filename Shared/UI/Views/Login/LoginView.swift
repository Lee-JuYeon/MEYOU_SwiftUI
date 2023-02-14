//
//  LoginView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI

struct LoginView : View {

    init(){
        
    }
    
    @Environment(\.colorScheme) private var scheme
    @EnvironmentObject private var authVM : AuthVM
    @EnvironmentObject private var destinationVM : DestinationVM
    
    
    var body: some View {
        VStack(
            alignment : HorizontalAlignment.center,
            spacing : 10
        ){
            LogoView(
                setWidth: 200,
                setHeight: 80,
                setTint: Theme.trendYellow,
                setOnClick: {
                    
                }
            )
            
            EmailTextfieldView(setText: $authVM.email)
            PasswordTextfieldView(setText: $authVM.password)
     
            LoginButtonView(
                setOnClick: {
                    authVM.login(
                        onSuccess: {
                            destinationVM.changeDestination(
                                destination: .MAINVIEW
                            )
                        },
                        onFailed: {
                            
                        }
                    )
                }
            )
            
            HStack(
                alignment: VerticalAlignment.center,
                spacing: 50,
                content: {
                    ForgetPasswordView(
                        setOnClick: {
                            
                        }
                    )
                    
                    RegisterButtonView(
                        setOnClick: {
                            destinationVM.changeDestination(
                                destination: DestinationType.REGISTER
                            )
                            authVM.email = ""
                            authVM.password = ""
                        }
                    )
                }
            )//HStack
            
            let testString : AttributedTextModel = AttributedTextModel(
                text: LocalizedStringKey("terms_of_service_login_notify").toString(),
                attributedText: LocalizedStringKey("terms_of_service_title").toString(),
                link: "https://www.naver.com/"
            )
            AttributedText(attributedTextModel: testString)
        }//VStack
        .padding(.horizontal, 10)
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity
        )
        .background(
            Theme.backgroundColour(forScheme: scheme)
        )
    }
}
