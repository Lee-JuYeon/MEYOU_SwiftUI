//
//  ImagePicker.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/13.
//

import SwiftUI
import PhotosUI
import Photos
import ReplayKit

//if #available(iOS 14, *) {
//    PHPicker
//} else {
//    UIImagePicke
//}

//// ios 14버전 이상
//@available(iOS 14, *)
//extension PreviewViewController: PHPickerViewControllerDelegate {
//
//    func pickImage(){
//        var configuration = PHPickerConfiguration()
//        /*
//         이미지 정보를 가지고 올 필요가 있을땐 photolibrary를 사용해준다.
//         let photoLibrary = PHPhotoLibrary.shared()
//         var configuration = PHPickerConfiguration(photoLibrary : photoLibrary)
//         */
//        configuration.selectionLimit = 6 // 한번에 가지고 올 이미지 갯수 제한
//        configuration.filter = .any(of: [.images])
//        let picker = PHPickerViewController(configuration: configuration)
//        picker.delegate = self
//        self.present(picker, animated : true, completion : nil)
//    }
//
//    func picker(_ picker : PHPickerViewController, didFinishPicking results : [PHPickerResult]){
//        var imgData : Data?
//        var img : UIImage?
//        var imgFile = PreviewItem()
//
//        picker.dismiss(animated: true, completion: nil)
//
//        let itemProvider = results.first?.itemProvider
//
//        if let itemProvider = itemProvider,
//           itemProvider.canLoadObject(ofClass: UIImage.self){
//            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
//                DispatchQueue.main.async {
//                    self.preview.image = image as? UIImage
//
//                    //이미지의 정보가 필요할때 사용하는 코드
////                    let identifiers = results.compactMap(\.assetIdentifier)
////                    let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
//
////                    if let filename = fetchResult.firstObject?.value(forKey: "filename") as? String{
////                       이미지의 이름을 가지고 옴//get image file name
////                    }
//
//                }
//            }
//        }
//    }
//}
//
////ios 14 미만 //used when lower than ios 14
//extension PreviewViewController: UIImagePickerControllerDelegate {
//    func openGallery(){
//        let picker = UIImagePickerController()
//        picker.delegate = self
//
//        picker.sourceType = .photoLibrary
//        present(picker, animated: true, completion: nil)
//    }
//
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
//            DispatchQueue.main.async {
//                self.preview.image = image
//            }
//
//            //이미지 파일 이름 가져옴//get image file name
////            var fileName: String = ""
////            let imgData = image.jpegData(compressionQuality: 1.0)
////            if let asset = info[UIImagePickerController.InfoKey.phAsset] as? PHAsset{
////                fileName = asset.value(forKey: "filename") as? String ?? ""
//            }
//
//        }
//
//        self.dismiss(animated: true, completion: nil)
//    }
//}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var images : [UIImage]
    @Binding var isShowGallery : Bool
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        images = [UIImage]()
        var config: PHPickerConfiguration {
            var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
            config.filter = .images //videos, livePhotos...
            config.selectionLimit = 6 //0 => any, set 1-2-3 for har limit
            config.preferredAssetRepresentationMode = .current
            return config
        }
        
        let controller = PHPickerViewController(configuration: config)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator : NSObject, PHPickerViewControllerDelegate {
        private let parent : ImagePicker
        
        init(_ parent : ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker : PHPickerViewController, didFinishPicking results : [PHPickerResult]) {
            // picker화면 닫기
            parent.isShowGallery.toggle()
            
            guard !results.isEmpty else { return }
            
            for index in results.indices {
                // 이미지를 로드할 수 있는지 확인
                if results[index].itemProvider.canLoadObject(ofClass: UIImage.self){
                    // 선택된 이미지에 대한 검색
                    results[index].itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                        
                        DispatchQueue.main.async {
                            guard let image = object else {
                                print("ImagePicker, picker // Error : \(String(describing: error?.localizedDescription))")
                                return
                            }
                            self.parent.images.append(image as! UIImage)
                        }
                    }
                }else{
                    print("ImagePicker, picker // Error : can not load images")
                }
            }
        }
    }
}

/*
 @Binding private var selectedImage: UIImage
 private var sourceType: UIImagePickerController.SourceType = .photoLibrary
 
 init(
     setSelectedImage : Binding<UIImage>,
     setSourceType : UIImagePickerController.SourceType
 ){
     self._selectedImage = setSelectedImage
     self.sourceType = setSourceType
 }
 @Environment(\.presentationMode) private var presentationMode
 
 

 func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

     let imagePicker = UIImagePickerController()
     imagePicker.allowsEditing = false
     imagePicker.sourceType = sourceType
     imagePicker.delegate = context.coordinator

     return imagePicker
 }

 func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

 }

 func makeCoordinator() -> Coordinator {
     Coordinator(self)
 }

 final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

     var parent: ImagePicker

     init(_ parent: ImagePicker) {
         self.parent = parent
     }

     func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

         if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
             parent.selectedImage = image
         }

         parent.presentationMode.wrappedValue.dismiss()
     }

 }
 */
