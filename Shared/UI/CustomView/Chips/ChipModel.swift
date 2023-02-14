//
//  ChipModel.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/19.
//

import SwiftUI

struct ChipModel: Identifiable, Hashable {
    var id = UUID().uuidString
    var text : String
    var size : CGFloat = 0
}
