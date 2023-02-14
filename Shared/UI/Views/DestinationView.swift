//
//  ContentView.swift
//  Shared
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI

struct DestinationView : View {

    @StateObject var destinationVM = DestinationVM()
    @StateObject var authVM = AuthVM()

    @State private var something : Bool = false

    var body : some View {
//        authVM.auth == nil ? LoginRegisterView() : MainView()
//        if authVM.auth == nil {
//            LoginRegisterView()
//        }else{
//            MainView()
//        }
        switch destinationVM.currentDestination {
        case .SPLASH :
            SplashView()
                .environmentObject(authVM)
                .environmentObject(destinationVM)
        case .LOGIN :
            LoginView()
                .environmentObject(authVM)
                .environmentObject(destinationVM)
        case .REGISTER :
            RegisterView()
                .environmentObject(authVM)
                .environmentObject(destinationVM)
        case .MAINVIEW :
            MainView()
                .environmentObject(authVM)
                .environmentObject(destinationVM)
        }
    }
}
