//
//  RegisterSecondView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/10.
//

import SwiftUI

struct RegisterSecondView: View {
    
    @Binding private var getCurrentPage : Int
    
    init(
        setCurrentPage : Binding<Int>
    ){
        self._getCurrentPage = setCurrentPage
    }
    
    @Environment(\.colorScheme) private var scheme
    @EnvironmentObject private var authVM : AuthVM
    @State private var unvalidReason : String = "";

    var body: some View {
        ScrollView(.vertical){
            VStack(
                alignment : HorizontalAlignment.trailing,
                spacing : 10
            ){

                EmailTextfieldView(setText: $authVM.email)
                PasswordTextfieldView(setText: $authVM.password)
               
                HStack(
                    alignment : VerticalAlignment.center,
                    spacing: 5
                ){
                    // 회원가입 실패 이유 textview
                    if unvalidReason != "" {
                        Text(unvalidReason)
                            .foregroundColor(
                                Theme.textColour(forScheme: scheme)
                            )
                    }
                    
                    // 회원가입 버튼 뷰
                    Text("➡️")
                        .font(.system(size: 40))
                        .onTapGesture {
                            authVM.register(
                                onSuccess: {
                                    // 파베 계정생성완료했으니 화면전환
                                    getCurrentPage = 2
                                    print("success")
                                },
                                onFailed: { reason in
                                    // 파베 계정생성 실패
                                    unvalidReason = reason
                                    print("RegisterFirstView, authVM.register, onFailed // Error : \(reason)")
                                }
                            )
                        }
                }//hstack
            }//vstack
            .padding(10)
        }//scrollview
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
        .padding(EdgeInsets(
            top: UIApplication.shared.windows.first!.safeAreaInsets.top,
            leading: 0,
            bottom: UIApplication.shared.windows.first!.safeAreaInsets.bottom,
            trailing: 0
        ))

    }
}

/*
 uid        String
 name        String v
 gender        Gender v
 
 birthday        Date v
 
 job        [String] v
 
 school        String v
 career        [String] v
 
 city        GPS v
 bio        String
 chips        [String]
 verify        bool
 vip    유료서비스    bool
 banned        bool
 */
