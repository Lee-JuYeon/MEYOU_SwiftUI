//
//  AuthVM.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/07/04.
//

import SwiftUI
import Firebase
import FirebaseStorage
import FirebaseDatabase
import FirebaseDatabaseSwift

class AuthVM : ObservableObject {
    
    private var auth : User? = nil
    @Published var chips : [String] = [];
    
    private let db = Database.database(url: "https://meyou-6ca01-default-rtdb.asia-southeast1.firebasedatabase.app").reference()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()

    init(){
    }
    
    
    let emailHint : LocalizedStringKey = "emailHint"
    let pwHint : LocalizedStringKey = "pwHint"
    func login(
        onSuccess : @escaping () -> Void,
        onFailed : @escaping () -> Void
    ){
        do{
            Auth.auth().signIn(withEmail: email,password: password) { (result, error) in
                if error != nil {
                    print(error?.localizedDescription ?? "")
                    onFailed()
                } else {
                    self.auth = result?.user
                    self.userInfoCheck(
                        onSuccess: {
                            onSuccess()
                        },
                        onFailed: {
                            onFailed()
                        }
                    )
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
    
    @Published private var userInfo_requestList : [UserInfoModel] = []
    private func userInfoCheck(
        onSuccess : @escaping () -> Void,
        onFailed : @escaping () -> Void
    ){
        do{
            self.db.child("userInfo/registerRequest/")
                .observeSingleEvent(of: .value, with: { [weak self] snapshot in
                    guard
                        let self = self,
                        var json = snapshot.value as? [String : Any]
                    else {
                        return
                    }
                    
//                    json["uid"] = snapshot.key
                    
                    do {
//                        let userInfoData = try JSONSerialization.data(withJSONObject: json)
//                        let userInfo = try self.decoder.decode(UserInfoModel.self, from: userInfoData)
                        for child in snapshot.children {
                            if let data = child as? DataSnapshot {
                                print("????????? : \(data)")
                            }
                        }
//                        self.userInfo_requestList.append(userInfo)
//
//                        self.userInfo_requestList.map { userInfoModel in
//                            if userInfoModel.uid == self.getAuth().uid {
//                                // waiting ?????? ??????
//                                print("???????????? ???????????? ?????? ??????")
//                            }else{
//                                //mainview??? ??????
//                                print("userInfoModel : \(userInfoModel)")
//                                print("???????????? ??????")
//                            }
//                        }
                    } catch {
                        print("AuthVM, userInfoCheck, observing // Error : \(error.localizedDescription)")
                    }
                })
        }catch{
            print("AuthVM, userInfoCheck // Error : \(error.localizedDescription)")
        }
    }
    
    func snsVerify(){
        do{
            
        }catch{
            
        }
    }
    
    func getAuth() -> User {
        return auth!
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
                self.auth = user
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
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            let userInfoData : [String : Any] = [
                "uid" : self.getAuth().uid,
                "name" : self.name,
                "gender" : self.gender.rawValue,
                "birthday" : dateFormatter.string(from: self.birthday),
                "job" : self.jobs,
                "career" : self.career,
                "city" : self.city,
                "bio" : self.bio,
                "chips" : self.chips,
                "verify" : false,
                "vip" : false,
                "banned" : false
            ]

            
            imageUpload(
                onSuccess: {
                    self.db.child("userInfo/registerRequest/\(self.getAuth().uid)")
                        .setValue(userInfoData)
                },
                onFailed: {
                    print("AuthVM, setInformation, imageUpload, onFailed // Error ")
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
//            let ref = Storage.storage().reference(withPath: "/UserInformation/selfies/\(String(describing: auth?.uid))")
            guard let authUID = auth?.uid else { return }
            let ref = Storage.storage().reference(withPath: "/UserInformation/selfies/\(authUID)")
            
            let setMetadata = StorageMetadata()
            // jpg??? ????????? ???????????? ????????? application/octet-stream???????????? ????????????.
            setMetadata.contentType = "image/jpg"
            
            for mImage in images {
                /*
                 jpegData = jpeg??? ????????? ???????????? ???????????? ?????????.
                 compressionQuality = 0??? ?????? ??????(?????? ??????), 1??? ?????? ?????? (????????????)
                 */
                guard let imageData = mImage.jpegData(compressionQuality: 0.9) else { return }
                
                // ????????????
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SS"
                let current_date_string = formatter.string(from: Date())
                
                // ????????? ?????? ??????
                let imageName = "\(authUID)_\(current_date_string)"
                
                ref.child(imageName).putData(imageData, metadata: setMetadata) { storageMetaData, error in
                    if let error = error {
                        print("AuthVM, imageUpload, ref.putData // Error : \(error.localizedDescription)")
                        return
                    }else{
                        onSuccess()
                    }
                }
            }
        }catch{
            print("AuthVM, imageUpload // Error : \(error.localizedDescription)")
            onFailed()
        }
    }
    
    private func readData(){
        db.child("asdf").observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value as? [String : Any] else { return }
            print("value : \(value)")
        })
    }
    
    func stopDBListening(){
        db.removeAllObservers()
    }
}
