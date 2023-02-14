//
//  TermsOfServiceRegisterView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/04.
//

import SwiftUI

struct TermsOfServiceRegisterView: View {
    
    @Binding private var isCheckAll : Bool 
    
    init(
        setIsCheckAll : Binding<Bool>
    ){
        self._isCheckAll = setIsCheckAll
    }
    
    @Environment(\.colorScheme) private var scheme
    @State private var isShowSheet : Bool = false
    @State private var checkList : [Bool] = [false, false, false, false, false]
    
    var body: some View {
        Text(LocalizedStringKey("terms_of_service_title"))
            .font(Font.system(size:30, weight: .heavy, design: .default))
        VStack(
            alignment : HorizontalAlignment.leading,
            spacing: 0
        ){
            HStack(
                alignment : VerticalAlignment.top,
                spacing: 0
            ){
                
                Text(isCheckAll ? "[✓]" : "[   ]")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .onTapGesture {
                        isCheckAll = !isCheckAll
                        checkAll(checker: $isCheckAll)
                    }
                
                Text("아래 항목에 전부 동의합니다")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
            }
            //Hstack "아래 항목에 전부 동의합니다."
            
            HStack(
                alignment : VerticalAlignment.top,
                spacing: 0
            ){
                Text(checkList[0] ? "[✓]" : "[   ]")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .onTapGesture {
                        checkList[0] = !checkList[0]
                    }
                
                Text("(필수)개인정보(위치정보 포함)의 수집 및 이용에 동의합니다.")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .onTapGesture {
                        isShowSheet = !isShowSheet
                    }
                    .sheet(
                        isPresented: $isShowSheet,
                        onDismiss: {},
                        content: {

                        }
                    )
            }
            .padding(
                EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
            )//Hstack "개인정보 + 위치정보."
            HStack(
                alignment : VerticalAlignment.top,
                spacing: 0
            ){
                Text(checkList[1] ? "[✓]" : "[   ]")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .onTapGesture {
                        checkList[1] = !checkList[1]
                    }
                
                Text("(필수)위치기반서비스 이용약관에 동의합니다.")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .onTapGesture {
                        isShowSheet = !isShowSheet
                    }
                    .sheet(
                        isPresented: $isShowSheet,
                        onDismiss: {},
                        content: {

                        }
                    )
            }
            .padding(
                EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
            )//Hstack "위치기반서비스 이용약관"
            HStack(
                alignment : VerticalAlignment.top,
                spacing: 0
            ){
                Text(checkList[2] ? "[✓]" : "[   ]")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .onTapGesture {
                        checkList[2] = !checkList[2]
                    }
                
                Text("(필수)이용약관에 동의합니다.")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .onTapGesture {
                        isShowSheet = !isShowSheet
                    }
                    .sheet(
                        isPresented: $isShowSheet,
                        onDismiss: {},
                        content: {

                        }
                    )
            }
            .padding(
                EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
            )//Hstack "이용약관"
            HStack(
                alignment : VerticalAlignment.top,
                spacing: 0
            ){
                Text(checkList[3] ? "[✓]" : "[   ]")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .onTapGesture {
                        checkList[3] = !checkList[3]
                    }
                
                Text("(필수)개인정보의 제3자 제공에 동의합니다.")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .onTapGesture {
                        isShowSheet = !isShowSheet
                    }
                    .sheet(
                        isPresented: $isShowSheet,
                        onDismiss: {},
                        content: {

                        }
                    )
            }
            .padding(
                EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
            )//Hstack "개인정보의 제3자 제공동의"
            HStack(
                alignment : VerticalAlignment.top,
                spacing: 0
            ){
                Text(checkList[4] ? "[✓]" : "[   ]")
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    .onTapGesture {
                        checkList[4] = !checkList[4]
                    }
                
                Text("(필수)개인정보의 국외 이전에 동의합니다.")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 20))
                    .onTapGesture {
                        isShowSheet = !isShowSheet
                    }
                    .sheet(
                        isPresented: $isShowSheet,
                        onDismiss: {},
                        content: {

                        }
                    )
            }
            .padding(
                EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0)
            )//Hstack "개인정보 국외이전 동의."
            
        }//VStaack
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Theme.buttonColour(forScheme: scheme))
        )
        .padding(10)
        .onChange(of: checkList) { list in
            if list == [true, true, true, true, true] {
                isCheckAll = true
            }else{
                isCheckAll = false
            }
        }
    }
    
//    @ViewBuilder
//    private func showSheet(type : String) -> View {
//
//    }
    
    private func checkAll(checker : Binding<Bool>){
        switch isCheckAll {
        case true :
            checkList = [true, true, true, true, true]
            break;
        case false :
            checkList = [false, false, false, false, false]
            break;
        }
    }
}
