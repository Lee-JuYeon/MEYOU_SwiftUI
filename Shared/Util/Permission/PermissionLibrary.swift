//
//  PermissionLibrary.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/16.
//

import Photos
import UIKit

class PermissionLibrary {
    
    func checkPermissionLibrary(
        onSuccess : @escaping () -> Void,
        onDenied : @escaping () -> Void
    ) {
        // 포토 라이브러리 접근 권한
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
        case .authorized:
            onSuccess()
            print("항상 허용")
            break
        case .limited:
            onSuccess()
            print("선택한 사진만 허용")
            break
        case .denied:
            //다시 요청이 불가능하니, 설정창으로 이동해서 본인이 직접 권한줘야함.
            if let url = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                print("PermissionLibrary, checkPermissionLibrary, .denied // 설정창으로 이동.")
            }else {
                print("PermissionLibrary, checkPermissionLibrary, .denied // 설정창으로 이동 불가.")
            }
            print("권한 거부")
            break
        case .restricted :
            onDenied()
            print("권하을 부여할 수 없는 상태.")
            break
        case .notDetermined:
            // 처음 앱 시작하는거니, 권한요청함.
            requestPermissionLibrary(
                onSuccess: {
                    onSuccess()
                },
                onDenied: {
                    onDenied()
                }
            )
            print("앱 처음 시작 또는 처음으로 권한을 선택하는 경우")
            break
        default:
            print("그외")
            break
        }
    }
    
    func requestPermissionLibrary(
        onSuccess : @escaping () -> Void,
        onDenied : @escaping () -> Void
    ){
        let requiredAccessLevel: PHAccessLevel = .readWrite
        PHPhotoLibrary.requestAuthorization(for: requiredAccessLevel) { status in
            if #available(iOS 15.0, *){ // ios 15버전 이상
                switch status {
                case .limited:
                    print("선택한 사진에 대해서만 허용")
                    onSuccess()
                case .authorized:
                    print("모든 권한 허용")
                    onSuccess()
                default:
                    print("Unimplemented")
                    onDenied()
                }
            }else{ // ios 14버전 이하.
                switch status {
                case .authorized:
                    print("모든 권한 허용")
                    onSuccess()
                default:
                    print("Unimplemented")
                    onDenied()
                }
            }
        }
    }
}


