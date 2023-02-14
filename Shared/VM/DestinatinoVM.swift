//
//  SystemVM.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/01.
//

import SwiftUI

class DestinationVM : ObservableObject {
    
    /*
     auto 로그인
     비밀번호재설정
     얼굴인식
     sns인증
     auth값
     
     userDefault ( autologing : bool / email : string / pw : string )
     */
    
    @Published var currentDestination : DestinationType = .SPLASH
    
    init(){
        
    }
    
    func changeDestination(destination : DestinationType) {
        do {
            currentDestination = destination
        }catch{
            print("DestinatinoVM, changeDestination // Err \(error.localizedDescription)")
        }
    }
}
