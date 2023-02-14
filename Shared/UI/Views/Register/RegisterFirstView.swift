//
//  RegisterFirstView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/10.
//

import SwiftUI

struct RegisterFirstView: View {
    

    @Binding private var getCurrentPage : Int
    
    init(
        setCurrentPage : Binding<Int>
    ){
        self._getCurrentPage = setCurrentPage
    }
    
    @Environment(\.colorScheme) private var scheme
    @EnvironmentObject private var authVM : AuthVM
    @EnvironmentObject private var destinationVM : DestinationVM
    @State private var isCheckAll : Bool = false
    
    var body: some View {
        ScrollView(
            .vertical,
            showsIndicators : true
        ){
            VStack(
                alignment : HorizontalAlignment.leading,
                spacing : 10
            ){
                //이용약관뷰
                TermsOfServiceRegisterView(
                    setIsCheckAll: $isCheckAll
                )
                
                HStack(){
                    Text("⬅️")
                        .font(.system(size: 40))
                        .onTapGesture {
                            destinationVM.changeDestination(
                                destination: DestinationType.LOGIN
                            )
                        }
                    Spacer()
                    
                    // 회원가입 버튼 뷰
                    if isCheckAll {
                        Text("➡️")
                            .font(.system(size: 40))
                            .onTapGesture {
                                getCurrentPage = 1
                            }
                    }
                }//Hstack
            }//vstack
            .padding(10)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            .padding(.top, 10)
        }//scrollView
        .padding(EdgeInsets(
            top: UIApplication.shared.windows.first!.safeAreaInsets.top,
            leading: 0,
            bottom: UIApplication.shared.windows.first!.safeAreaInsets.bottom,
            trailing: 0
        ))
    }
}
