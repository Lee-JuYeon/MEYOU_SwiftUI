//
//  RegisterThirdView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/10.
//

import SwiftUI

struct RegisterThirdView: View {
    
    @Binding private var getCurrentPage : Int
    
    init(
        setCurrentPage : Binding<Int>
    ){
        self._getCurrentPage = setCurrentPage
    }
    
    @Environment(\.colorScheme) private var scheme
    @EnvironmentObject private var authVM : AuthVM
    @EnvironmentObject private var destinationVM : DestinationVM

    var body: some View {
        ScrollView(.vertical){
            VStack(
                alignment : HorizontalAlignment.leading,
                spacing : 10
            ){

                SelfiesView(
                    setSelfies: $authVM.images
                )
                
                NameGenderView(
                    setText: $authVM.name,
                    setGender : $authVM.gender
                )
            
                JobCareerView(
                    setJobs: $authVM.jobs,
                    setCareers: $authVM.career
                )
                
                BirthdayCityView(
                    setBirthday: $authVM.birthday,
                    setCity: $authVM.city
//                    setSchool: $authVM.school
                )

                BioChipsView(
                    setBio: $authVM.bio
                )
                
                HStack(){
                    Text("⬅️")
                        .font(.system(size: 40))
                        .onTapGesture {
                            getCurrentPage = 1
                        }
                    Spacer()
                    Text("🆗")
                        .font(.system(size: 40))
                        .onTapGesture {
                            //완료
                            authVM.setInformation(
                                onSuccess: {
//                                    destinationVM.changeDestination(
//                                        destination: DestinationType.MAINVIEW
//                                    )
                                    print("vm에서 성공했다고 함~")
                                },
                                onFailed: {
                                    print("vm에서 실패했다고 하네요~")
                                }
                            )
                        }
                }
            }//vstack
            .padding(10)
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
