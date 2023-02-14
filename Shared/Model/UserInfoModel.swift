//
//  UserInfoModel.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/02/14.
//

import SwiftUI

struct UserInfoModel : Hashable{
    let uid: String
    let name: String
    let gender: Gender
    let birthday : Date
    let job: [String] 
    let career: [String]
    let city: String // uncheck
    let bio : String
    let chips: [String] //uncheck
    let verify: Bool
    let vip : Bool
    let banned : Bool
}
