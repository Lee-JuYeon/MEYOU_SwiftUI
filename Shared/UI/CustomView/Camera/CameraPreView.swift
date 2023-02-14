//
//  CameraView.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/02.
//

import SwiftUI
import AVFoundation

struct CameraPreView: UIViewRepresentable {
    class VideoPreviewView: UIView {
        override class var layerClass: AnyClass {
            AVCaptureVideoPreviewLayer.self
        }
           
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            return layer as! AVCaptureVideoPreviewLayer
        }
    }
       
    let session: AVCaptureSession
    
    func makeUIView(context: Context) -> VideoPreviewView {
        let view = VideoPreviewView()
        
        // 기본 백그라운드 색 지정
        view.backgroundColor = .black
        
        // 카메라 프리뷰 ratio 조정
        view.videoPreviewLayer.videoGravity = .resizeAspectFill
        
        // 프리뷰 모서리에 corner radius를 결정
        view.videoPreviewLayer.cornerRadius = 0
        
        // 카메라 세션 지정(필수)
        view.videoPreviewLayer.session = session
        
        // 비디오 기본 방향 지정. .portrait이 우리가 아는 세로모드.
        view.videoPreviewLayer.connection?.videoOrientation = .portrait

        return view
    }
    
    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
           
    }
}
