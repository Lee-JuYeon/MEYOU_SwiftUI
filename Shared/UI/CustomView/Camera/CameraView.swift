//
//  CameraView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/02.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    @ObservedObject var viewModel = CameraVM()

    var body: some View {
          ZStack {
              viewModel.cameraPreview.ignoresSafeArea()
                  .onAppear {
                      viewModel.configure()
                  }
                  .gesture(MagnificationGesture()
                            .onChanged { val in
                                viewModel.zoom(factor: val)
                            }
                            .onEnded { _ in
                                viewModel.zoomInitialize()
                            }
                  )
              
              VStack {
                  HStack {
                      // 셔터사운드 온오프
                      Button(action: {viewModel.switchFlash()}) {
                          Image(systemName: viewModel.isFlashOn ?
                                "speaker.fill" : "speaker")
                              .foregroundColor(viewModel.isFlashOn ? .yellow : .white)
                      }
                      .padding(.horizontal, 30)
                      
                      // 플래시 온오프
                      Button(action: {viewModel.switchSilent()}) {
                          Image(systemName: viewModel.isSilentModeOn ?
                                "bolt.fill" : "bolt")
                              .foregroundColor(viewModel.isSilentModeOn ? .yellow : .white)
                      }
                      .padding(.horizontal, 30)
                  }
                  .font(.system(size:25))
                  .padding()
                  
                  Spacer()
                  
                  HStack{
                      // 찍은 사진 미리보기
                      Button(action: {}) {
                          // ✅ view 추가
                          if let previewImage = viewModel.recentImage {
                              Image(uiImage: previewImage)
                                  .resizable()
                                  .scaledToFill()
                                  .frame(width: 75, height: 75)
                                  .clipShape(RoundedRectangle(cornerRadius: 15))
                                  .aspectRatio(1, contentMode: .fit)
                          } else {
                              // ✅ linewidth 살짝 수정
                              RoundedRectangle(cornerRadius: 15)
                                  .stroke(lineWidth: 3)
                                  .foregroundColor(.white)
                                  .frame(width: 75, height: 75)
                          }
                      }
                      .padding()
                      
                      Spacer()
                      
                      // 사진찍기 버튼
                      Button(action: {viewModel.capturePhoto()}) {
                          Circle()
                              .stroke(lineWidth: 5)
                              .frame(width: 75, height: 75)
                              .padding()
                      }
                      
                      Spacer()
                      
                      // 전후면 카메라 교체
                      Button(action: {viewModel.changeCamera()}) {
                          Image(systemName: "arrow.triangle.2.circlepath.camera")
                              .resizable()
                              .scaledToFit()
                              .frame(width: 50, height: 50)
                          
                      }
                      .frame(width: 75, height: 75)
                      .padding()
                  }
              }
              .foregroundColor(.white)
          }// Zstack
          .opacity(viewModel.shutterEffect ? 0 : 1)
      }
}
