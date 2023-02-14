//
//  ExtensionString.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/10.
//

import SwiftUI

extension LocalizedStringKey {

    // This will mirror the `LocalizedStringKey` so it can access its
    // internal `key` property. Mirroring is rather expensive, but it
    // should be fine performance-wise, unless you are  
    // using it too much or doing something out of the norm.
    var printKey: String {
        Mirror(reflecting: self).children.first(where: { $0.label == "key" })!.value as! String
    }
    
    func toString(locale: Locale = .current) -> String {
        return .localizedString(for: self.printKey, locale: locale)
    }
}
