//
//  JobCareerView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/15.
//

import SwiftUI

struct JobCareerView: View {
    
    @Binding private var jobs : [String]
    @Binding private var career : [String]
    
    init(
        setJobs : Binding<[String]>,
        setCareers : Binding<[String]>
    ){
        self._jobs = setJobs
        self._career = setCareers
    }
    
    @Environment(\.colorScheme) private var scheme
    @State private var careerText : String = "";
    @State private var jobText : String = "";

    var body: some View {
        VStack(
            alignment : HorizontalAlignment.leading
        ){
            // Job
            VStack(
                alignment : HorizontalAlignment.leading
            ){
                HStack(
                    alignment : VerticalAlignment.center
                ){
                    PlaceHolderTextfield(
                        setText: $jobText,
                        setTextColour: Color.black,
                        setHint: LocalizedStringKey("jobHint"),
                        setHintColour: Theme.hintColour(forScheme: scheme),
                        setBackgroundColour: Theme.textFieldBackgroundColour(forScheme: scheme),
                        setCornerRadius: 0,
                        setKeyboardType: .namePhonePad
                    )
                 
                    Text("➕")
                        .font(.system(size: 20))
                        .onTapGesture {
                            jobs.insert(jobText, at: jobs.count)
                            jobText = ""
                        }
                }//hstack
                
                LazyVStack(
                    alignment : HorizontalAlignment.leading,
                    spacing : 5
                ){
                    ForEach(jobs.indices, id : \.self) { index in
                        HStack(
                            alignment : VerticalAlignment.center
                        ){
                            Text("💼 \(jobs[index])")
                                .foregroundColor(Color.black)
                            Text("✖️")
                                .font(.system(size: 15))
                                .onTapGesture {
                                    jobs.remove(at: index)
                                }
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    Theme.textColour(forScheme: scheme),
                                    lineWidth: 1
                                )
                        )
                    }
                }//lazyVStack
            }//vstack
            .padding(10)
            .background(Theme.buttonColour(forScheme: scheme))
            .cornerRadius(10)
            
         
            // Career
            VStack(
                alignment : HorizontalAlignment.leading
            ){
                HStack(
                    alignment : VerticalAlignment.center
                ){
                    PlaceHolderTextfield(
                        setText: $careerText,
                        setTextColour: Color.black,
                        setHint: LocalizedStringKey("careerHint"),
                        setHintColour: Theme.hintColour(forScheme: scheme),
                        setBackgroundColour: .clear,
                        setCornerRadius: 0,
                        setKeyboardType: .namePhonePad
                    )
                 
                    Text("➕")
                        .font(.system(size: 20))
                        .onTapGesture {
                            career.insert(careerText, at: career.count)
                            careerText = ""
                        }
                }//hstack
                
                LazyVStack(
                    alignment : HorizontalAlignment.leading,
                    spacing : 5
                ){
                    ForEach(career.indices, id : \.self) { index in
                        HStack(
                            alignment : VerticalAlignment.center
                        ){
                            Text("📌 \(career[index])")
                                .foregroundColor(Color.black)
                            Text("✖️")
                                .font(.system(size: 15))
                                .onTapGesture {
                                    career.remove(at: index)
                                }
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(
                                    Theme.textColour(forScheme: scheme),
                                    lineWidth: 1
                                )
                        )
                    }
                }//lazyVStack
            }//vstack
            .padding(10)
            .background(Theme.buttonColour(forScheme: scheme))
            .cornerRadius(10)
        }//vstack
    }
}
