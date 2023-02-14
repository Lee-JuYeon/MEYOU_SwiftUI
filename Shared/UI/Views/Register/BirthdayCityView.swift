//
//  BirthdayCityView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/15.
//

import SwiftUI

struct BirthdayCityView: View {
    
    @Binding private var birthday : Date
    @Binding private var city : String
//    @Binding private var school : String
    
    init(
        setBirthday : Binding<Date>,
        setCity : Binding<String>
//        setSchool : Binding<String>
    ){
        self._birthday = setBirthday
        self._city = setCity
//        self._school = setSchool
    }
    
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        VStack(
            alignment : HorizontalAlignment.leading
        ){
            HStack(
                alignment: VerticalAlignment.center,
                spacing: 5
            ) {
                Text(
                    LocalizedStringKey("birthdayLabel")
                )
                .foregroundColor(Color.black)


                DatePicker(
                    "",
                    selection: $birthday,
                    displayedComponents: .date
                )
                .labelsHidden()
                .datePickerStyle(.compact)
            }
            .padding(10)
            .background(Theme.textFieldBackgroundColour(forScheme: scheme))
            .cornerRadius(10)
            
            
//            HStack(
//                alignment: VerticalAlignment.center,
//                spacing: 5
//            ) {
//                Text(
//                    LocalizedStringKey("cityLabel")
//                )
//                    .foregroundColor(Color.black)
//                
//                var options = ["옵션1"]
//                Picker(
//                    "",
//                    selection: $city
//                ) {
//                  ForEach(0 ..< options.count) {
//                    Text(options[$0])
//                  }
//                }
//                .accentColor(.black)
//                .pickerStyle(.automatic)
//                .labelsHidden()
//            }
//            .padding(10)
//            .background(Theme.textFieldBackgroundColour(forScheme: scheme))
//            .cornerRadius(10)
            
//            HStack(
//                alignment: VerticalAlignment.center,
//                spacing: 5
//            ) {
//                Text(LocalizedStringKey("schoolLabel"))
//                    .foregroundColor(Theme.textColour(forScheme: scheme))
//
//                TextField(
//                    LocalizedStringKey("schoolHint"),
//                    text: $school
//                )
//                .foregroundColor(Theme.textColour(forScheme: scheme))
//                .padding(.all, 10)
//                .keyboardType(.namePhonePad)
//                .multilineTextAlignment(.leading)
//            }
        }
    }
}
