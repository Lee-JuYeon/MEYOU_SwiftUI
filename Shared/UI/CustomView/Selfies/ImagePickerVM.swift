//
//  ImagePickerVM.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/26.
//

import SwiftUI

class ImagePickerVM : ObservableObject {
    @Published var items = [ImagePickerModel]()
    
    func append(item : ImagePickerModel){
        items.append(item)
    }
}
