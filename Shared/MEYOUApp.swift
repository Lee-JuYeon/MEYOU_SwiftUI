//
//  MEYOUApp.swift
//  Shared
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI
import Firebase
//import UIKit

@main
struct MEYOUApp: App {
    
    init(){
        FirebaseApp.configure()
        
    }
    
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    
    var body: some Scene {
        WindowGroup {
            DestinationView()
        }
    }
}

/*
 오픈소스
 swipe view = https://github.com/bbaars/SwiftUI-Tinder-SwipeableCards
 
 */
