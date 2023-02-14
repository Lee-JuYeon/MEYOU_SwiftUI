//
//  SelfiesView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/14.
//

import SwiftUI
import PhotosUI
import Photos

struct SelfiesView: View {
    
    private var permissionLibrary : PermissionLibrary? = nil
    @Binding private var selfies : [UIImage]
    
    init(
        setSelfies : Binding<[UIImage]>
    ){
        self._selfies = setSelfies
        if permissionLibrary == nil{
            permissionLibrary = PermissionLibrary()
        }
    }
    
    @Environment(\.colorScheme) private var scheme
    @EnvironmentObject private var authVM : AuthVM
    @State private var isShowGallery = false
    
    @ObservedObject var imagePickerVM = ImagePickerVM()
   
    var body: some View {
        ScrollView(
            .horizontal, showsIndicators : true
        ){
            LazyHStack(
                alignment: VerticalAlignment.center,
                spacing: 10
            ){
                Text(LocalizedStringKey("getPhotoFromLibrary"))
                    .foregroundColor(Color.black)
                    .frame(width: 200, height: 200)
                    .cornerRadius(30)
                    .background(
                        RoundedRectangle(cornerRadius: 30)
                            .fill(
                                Theme.buttonColour(forScheme: scheme)
                            )
                    )
                    .onTapGesture {
                        permissionLibrary?.checkPermissionLibrary(
                            onSuccess: {
                                isShowGallery = true
                            },
                            onDenied: {
                                isShowGallery = false
                            }
                        )
                    }
                    .sheet(
                        isPresented: $isShowGallery,
                        onDismiss: {

                        },
                        content: {
                            ImagePicker(
                                images: $selfies,
                                isShowGallery: $isShowGallery
                            )
                        }
                    )
                
                ForEach(selfies, id:\.self){ img in
                    Image(uiImage : img)
                        .resizable()
                        .cornerRadius(30)
                        .frame(width: 200, height: 200)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(
                                    Theme.textColour(forScheme: scheme),
                                    lineWidth: 1
                                )
                        )
                }// forEach
            }//lazyHStack
        }//scrollview
    }
}

