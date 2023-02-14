//
//  RegisterView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI

struct RegisterView : View {

    
    init(){
        UITextView.appearance().backgroundColor = .clear
    }
    
    @Environment(\.colorScheme) private var scheme
    @EnvironmentObject private var authVM : AuthVM
    @EnvironmentObject private var destinationVM : DestinationVM
    
    @ObservedObject private var cameraVM = CameraVM();
    
    @State private var isSheetShow : Bool = false
    @State private var setPWcheck : String = ""
    
    @State private var currentPage : Int = 0
    var body: some View {
        PageView(
            setWidth: UIScreen.main.bounds.width,
            setHeight: UIScreen.main.bounds.height,
            setPageCount: 3,
            setScrollable: false,
            setCurrentIndex: $currentPage,
            setBackground: {
                Theme.backgroundColour(forScheme: scheme)
            },
            setContent: {
                /*
                 email, password
                 
                 name. birthday, gender, job, (school, career)
                 
                 city(gps), chips, bio
                 */
               
                RegisterFirstView(
                    setCurrentPage: $currentPage
                )
                .environmentObject(authVM)
                .environmentObject(destinationVM)
                
                RegisterSecondView(
                    setCurrentPage: $currentPage
                ).environmentObject(authVM)
                
                RegisterThirdView(
                    setCurrentPage: $currentPage
                )
                .environmentObject(authVM)
                .environmentObject(destinationVM)
            }
        )
            .ignoresSafeArea()
    }
}

/*
 private var setEmailHint : LocalizedStringKey = "emailHint"
 private var setUserNameHint : LocalizedStringKey = "userNameHint"
 private var setPWHint : LocalizedStringKey = "pwHint"
 private var setPWHintCheck : LocalizedStringKey = "pwHintCheck"
 private var setGenderLabel : LocalizedStringKey = "genderLabel"
 private var setBirthdayLabel : LocalizedStringKey = "birthdayLabel"
 private var setBioHint : LocalizedStringKey = "bioHint"
 */
/*
 ScrollView(.vertical, showsIndicators: false){
     VStack(
         alignment : HorizontalAlignment.center,
         spacing : 10
     ){
         // 프로필 사진
         TakeSelfieView()
         
         
         VStack(
             alignment: HorizontalAlignment.center,
             spacing: 0
         ){
             HStack(
                 alignment: VerticalAlignment.center,
                 spacing: 0
             ){
                 // 이름 입력
                 TextField(
                     setUserNameHint,
                     text: $authVM.name
                 )
                 .multilineTextAlignment(.center)
                 
                 // 성별 설정
                 GenderToggleView(gender: $authVM.gender)
             }
         
             Divider()
                 .padding(.horizontal, 0)
         }
         
         // 이메일 입력
         IconTextFieldView(
             setText: $authVM.email,
             setHint: setEmailHint,
             setImage: "icon_email"
         )
         
         // 비밀번호 입력
         IconSecureTextFieldView(
             setPW: $authVM.password,
             setPWHint: setPWHint
         )
         
         IconSecureTextFieldView(
             setPW: $setPWcheck,
             setPWHint: setPWHintCheck
         )
         
         // 자기소개 text
         ZStack{
             if authVM.bio == "" {
                 Text(setBioHint)
                     .foregroundColor(Color.secondary)
                     .multilineTextAlignment(.leading)
                     .frame(
                         minWidth: 0,
                         maxWidth: .infinity,
                         minHeight: 0,
                         maxHeight: .infinity,
                         alignment: .leading
                     )
             }

             TextEditor(
                 text: $authVM.bio
             )
             .background(Color.gray.opacity(0.0))
             .foregroundColor(Color.black)

         }
         .padding(10)
         .cornerRadius(10)
         .overlay(
             RoundedRectangle(cornerRadius: 10)
                 .stroke(Color.black, lineWidth: 1)
         )
        
         

         // 관심사 chips

         
         // 생일 spinner
         DatePicker(
             setBirthdayLabel,
             selection: $authVM.birthday,
             displayedComponents: .date
         ).labelsHidden()
         .datePickerStyle(WheelDatePickerStyle())
         
         // 사는곳 spinner
         // 배울 언어 spinner
         // 모국어 spinner
         
         HStack(
             alignment: VerticalAlignment.center,
             spacing: 0,
             content: {
                 Text("가입 완료")
                     .onTapGesture {
                         destinationVM.changeDestination(
                             destination: .MAINVIEW
                         )
                         
                     }
             }
         )
         
         // 인증 뷰
         AuthView()
     }//VStack
     
     .padding(.horizontal, 10)
 }//ScrollView
 .sheet(
     isPresented: $isSheetShow,
     onDismiss: {
         print("프사 라이브러리 시트 사라짐.")
     },
     content: {
//                ImagePicker(
//                    sourceType: .photoLibrary,
//                    selectedImage: self.$getSelfie
//                )
     }
 )
 */
