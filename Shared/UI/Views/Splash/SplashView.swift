//
//  SplashView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/08.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var authVM : AuthVM
    @EnvironmentObject var destinationVM : DestinationVM
    
    init (){
        /*
         인터넷 확인
         자동 로그인확인
         UserDefaults.standard.set(self.tapCount, forKey: "Tap")
         UserDefaults.standard.integer(forKey: "Tap")
         */
    }
    
    private func isAutoLogin() -> DestinationType {
        do{
            let pw = UserDefaults.standard.string(forKey: "pw")
            let email = UserDefaults.standard.string(forKey: "email")
            
            var returnData = DestinationType.LOGIN
            if (pw != nil && email != nil){
                //main view
                // firebase login
                authVM.email = email!
                authVM.password = pw!
                authVM.login(
                    onSuccess: {
                        returnData = DestinationType.MAINVIEW
                    },
                    onFailed: {
                        returnData = DestinationType.LOGIN
                    }
                )
                return returnData
            }else{
                //login view
                return DestinationType.LOGIN
            }
        }catch{
            print("SplashView, isAutoLogin // Err : \(error.localizedDescription)")
            return DestinationType.LOGIN
        }
    }
    
    
    @State private var getEmail : String = ""
    @State private var getPW : String = ""
    @State private var currentPage : Int = 0
    
    var body: some View {
        Rectangle()
            .fill(Color.purple)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            .overlay(
                Image("logo_text")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .onAppear(perform: {
                        destinationVM.changeDestination(
                            destination: isAutoLogin()
                        )
                    })// imageview
            )// rectangle
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}



/*
 switch isAutoLogin() {
 case ScreenType.SPLASH :
     print("splash")
     break
 case ScreenType.LOGIN :
     NavigationLink(
         destination: {
             LoginView(
                 setEmail: $getEmail,
                 setPW: $getPW,
                 setCurrentPage : $currentPage
             )
         },
         label: {
             
         }
     )
     print("LOGIN")
     break
 case ScreenType.REGISTER :
     
     NavigationLink(
         destination: {
             RegisterView(
                 setCurrentPage : $currentPage
             )
         },
         label: {
             
         }
     )
     print("REGISTER")
     break
 case ScreenType.MAINVIEW :
     print("MAINVIEW")
     break
 default :
     break
 }
 */
