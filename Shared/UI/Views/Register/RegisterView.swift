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
         // ????????? ??????
         TakeSelfieView()
         
         
         VStack(
             alignment: HorizontalAlignment.center,
             spacing: 0
         ){
             HStack(
                 alignment: VerticalAlignment.center,
                 spacing: 0
             ){
                 // ?????? ??????
                 TextField(
                     setUserNameHint,
                     text: $authVM.name
                 )
                 .multilineTextAlignment(.center)
                 
                 // ?????? ??????
                 GenderToggleView(gender: $authVM.gender)
             }
         
             Divider()
                 .padding(.horizontal, 0)
         }
         
         // ????????? ??????
         IconTextFieldView(
             setText: $authVM.email,
             setHint: setEmailHint,
             setImage: "icon_email"
         )
         
         // ???????????? ??????
         IconSecureTextFieldView(
             setPW: $authVM.password,
             setPWHint: setPWHint
         )
         
         IconSecureTextFieldView(
             setPW: $setPWcheck,
             setPWHint: setPWHintCheck
         )
         
         // ???????????? text
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
        
         

         // ????????? chips

         
         // ?????? spinner
         DatePicker(
             setBirthdayLabel,
             selection: $authVM.birthday,
             displayedComponents: .date
         ).labelsHidden()
         .datePickerStyle(WheelDatePickerStyle())
         
         // ????????? spinner
         // ?????? ?????? spinner
         // ????????? spinner
         
         HStack(
             alignment: VerticalAlignment.center,
             spacing: 0,
             content: {
                 Text("?????? ??????")
                     .onTapGesture {
                         destinationVM.changeDestination(
                             destination: .MAINVIEW
                         )
                         
                     }
             }
         )
         
         // ?????? ???
         AuthView()
     }//VStack
     
     .padding(.horizontal, 10)
 }//ScrollView
 .sheet(
     isPresented: $isSheetShow,
     onDismiss: {
         print("?????? ??????????????? ?????? ?????????.")
     },
     content: {
//                ImagePicker(
//                    sourceType: .photoLibrary,
//                    selectedImage: self.$getSelfie
//                )
     }
 )
 */
