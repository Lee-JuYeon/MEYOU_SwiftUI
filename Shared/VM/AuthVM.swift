//
//  AuthVM.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI
import Firebase
import FirebaseStorage

class AuthVM : ObservableObject {
    
    @Published var auth : User? = nil

    @Published var chips : [String] = [];
    init(){
        self.auth = Auth.auth().currentUser
    }
    
    let emailHint : LocalizedStringKey = "emailHint"
    let pwHint : LocalizedStringKey = "pwHint"
    func login(
        onSuccess : @escaping () -> Void,
        onFailed : @escaping () -> Void
    ){
        do{
            Auth.auth().signIn(
                withEmail: email,
                password: password
            ) { (result, error) in
                       if error != nil {
                           print(error?.localizedDescription ?? "")
                           onFailed()
                       } else {
                           print("success")
                           onSuccess()
                       }
                   }
        }catch{
            print("AuthVM, login // Error : \(error.localizedDescription)")
        }
    }
    
    func resetPassword(){
        do{
            
        }catch{
            
        }
    }
    
    func faceCheck(){
        do{
            
        }catch{
            
        }
    }
    
    func snsVerify(){
        do{
            
        }catch{
            
        }
    }
    
    func getAuth(){
        do{
            
        }catch{
            
        }
    }
    
    
    
    
    private func emailValidCheck(
        email : String,
        isValid : () -> Void,
        isUnValid : (LocalizedStringKey) -> Void
    ){
        do {
            let emailValid : String = "^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"
            
            if(email.range(of: emailValid,options:.regularExpression) != nil){
                isValid()
            }else{
                let emailUnvalidKey : LocalizedStringKey = "email unvalid"
                isUnValid(emailUnvalidKey)
            }
        }catch{
            print("RegisterFirstView, emailValidCheck : Err : \(error.localizedDescription)")
        }
    }
    
    private func passwordValidCheck(
        password : String,
        isValid : () -> Void,
        isUnValid : (LocalizedStringKey) -> Void
    ){
        do{
            let pwValid : String = "^(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8}$"
            
            if(password.range(of: pwValid,options:.regularExpression) != nil){
                isValid()
            }else{
                let passwordUnvalidKey : LocalizedStringKey = "password unvalid"
                isUnValid(passwordUnvalidKey)
            }
        }catch{
            print("RegisterFirstView, passwordValidCheck : Err : \(error.localizedDescription)")
        }
    }
    
    @Published var email : String = "";
    @Published var password : String = "";
    func register(
        onSuccess : @escaping () -> Void,
        onFailed : @escaping (String) -> Void
    ){
        do{
            Auth.auth().createUser(
                withEmail: email,
                password: password
            ) { authResult, error in
                if error != nil {
                    print("AuthVM, register, createUser // Error : \(error!.localizedDescription)")
                    onFailed(error!.localizedDescription)
                }
                           
                guard let user = authResult?.user else { return }
                let userUID = user.uid
                onSuccess()
            }
        }catch{
            onFailed(error.localizedDescription)
            print("AuthVM, register // Err : \(error.localizedDescription)")
        }
    }
    
    @Published var images : [UIImage] = [UIImage]();
    @Published var name : String = "";
    @Published var gender : Gender = .MALE;
    @Published var jobs : [String] = [];
    @Published var career : [String] = [];
    @Published var birthday : Date = Date();
    @Published var bio : String = "";
    @Published var city : String = "";
    func setInformation(
        onSuccess : @escaping () -> Void,
        onFailed : @escaping () -> Void
    ){
        do{
            /*
             이름, 성별, 직업, 경력, 생일, 자기소개
             + 셀카, 지역, chips
             
             셀카 v
             이름
             직업
             경력
             생년월일
             자기소개
             
             회원가입 신청 -> A or B(jail : fake, reported)/accept 처리.
             */
            
         
            
                        
            imageUpload(
                onSuccess: {
                    
                },
                onFailed: {
                    
                }
            )
        }catch{
            print("AuthVM, setInformation // Error : \(error.localizedDescription)")
            onFailed()
        }
    }
    
    private func imageUpload(
        onSuccess : @escaping () -> Void,
        onFailed : @escaping () -> Void
    ){
        do{
            let ref = Storage.storage().reference(withPath: "/UserInformation/\(auth?.uid)/selfies")
            
            let setMetadata = StorageMetadata()
            // jpg로 타입을 저장하지 않으면 application/octet-stream타입으로 저장된다.
            setMetadata.contentType = "image/jpg"
            
            for mImage in images {
                /*
                 jpegData = jpeg로 포멧된 이미지를 데이터로 바꿔줌.
                 compressionQuality = 0은 최대 압축(최저 품질), 1은 최저 압축 (최고품질)
                 */
                guard let imageData = mImage.jpegData(compressionQuality: 0.9) else { return }
                
                // 시간설정
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SS"
                let current_date_string = formatter.string(from: Date())
                
                // 이미지 이름 설정
                let imageName = "\(auth?.uid)_\(current_date_string)"
                
                ref.child(imageName).putData(imageData, metadata: setMetadata) { storageMetaData, error in
                    if let error = error {
                        print("AuthVM, imageUpload, ref.putData // Error : \(error.localizedDescription)")
                        return
                    }else{
                        print("성공한 파일 이름 : \(imageName)")
                        onSuccess()
                    }
                }
            }
        }catch{
            print("AuthVM, imageUpload // Error : \(error.localizedDescription)")
            onFailed()
        }
    }
}