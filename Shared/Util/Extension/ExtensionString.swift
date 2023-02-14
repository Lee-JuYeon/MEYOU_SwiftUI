//
//  ExtensionString.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2022/12/14.
//

import SwiftUI

extension String {
    func toImage() -> UIImage? {
        if let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters){
            return UIImage(data: data)
        }
        return nil
    }
    
    static func localizedString(for key: String,
                                   locale: Locale = .current) -> String {
           
        let language = locale.languageCode
        let path = Bundle.main.path(forResource: language, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        let localizedString = NSLocalizedString(key, bundle: bundle, comment: "")
        
        return localizedString
    }
}
