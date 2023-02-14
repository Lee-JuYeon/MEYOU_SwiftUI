//
//  TakeSelfieView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/05.
//

import SwiftUI

struct TakeSelfieView: View {
    
    private let takeSelfieText : LocalizedStringKey = "takeSelfie"
    var body: some View {
        Text(takeSelfieText)
            .frame(width: 150, height: 150, alignment: .center)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(10)
            .onTapGesture {
                
            }
    }
}

class CameraaVM : ObservableObject {
    @Published var isFlashOn = false // 플래쉬
    @Published var isSilentModeOn = false // 무음모드
 
    
    func switchFlash() {
        isFlashOn.toggle()
    }
    
    func switchSilent() {
        isSilentModeOn.toggle()
    }
    
    func capturePhoto() {
        print("[CameraViewModel]: Photo captured!")
    }
    
    func changeCamera() {
        print("[CameraViewModel]: Camera changed!")
    }
}

