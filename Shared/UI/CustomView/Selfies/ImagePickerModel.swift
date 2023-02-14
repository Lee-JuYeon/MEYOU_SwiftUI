//
//  ImagePickerModel.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/26.
//

import SwiftUI
import Photos

struct ImagePickerModel : Identifiable{
    enum MediaType {
        case photo, video, livePhoto
    }
    
    var id: String
    var photo: UIImage?
    var url: URL?
    var livePhoto: PHLivePhoto?
    var mediaType: MediaType = .photo
    
    init(with photo: UIImage) {
        id = UUID().uuidString
        self.photo = photo
        mediaType = .photo
    }
}
