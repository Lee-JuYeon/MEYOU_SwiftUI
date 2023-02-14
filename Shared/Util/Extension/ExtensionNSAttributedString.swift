//
//  ExtensionNSAttributedString.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/10.
//

import SwiftUI

extension NSAttributedString {
  static func +(left: NSAttributedString, right: NSAttributedString) -> NSAttributedString {
    let result = NSMutableAttributedString()
    result.append(left)
    result.append(right)
    return result
  }
}
