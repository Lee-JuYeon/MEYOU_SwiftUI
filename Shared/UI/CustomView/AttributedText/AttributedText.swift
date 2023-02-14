//
//  TacticalText.swift
//  MEYOU
//
//  Created by C.A.V.S.S on 2023/01/05.
//

import SwiftUI

//@available(iOS 14.0, *) // 14버전 이상
struct AttributedText : UIViewRepresentable {
    
    let attributedTextModel : AttributedTextModel

    // UiTextView를 정의, 반환한다.
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
        textView.backgroundColor = .clear

        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textColor = UIColor.gray
        textView.backgroundColor = .clear
        textView.autocapitalizationType = .sentences
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        textView.delegate = context.coordinator
        textView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.systemBlue,
        ]
 
        return textView
    }
 
    /*
     textView의 attributedText에 NSAttributedString(string : text)로 NSAttributedString을 저장한다.
     특별히 updateUIView에 넣은 이유는 없다. updateUIView에 넣는 명령들을 모두 makeUIView에 넣어도 코드는 작동한다.
     */
    func updateUIView(_ textView: UITextView, context: Context) {
        
        let range = (attributedTextModel.text as NSString).range(of: attributedTextModel.attributedText)
        let attributedString = NSMutableAttributedString(string: attributedTextModel.text)
        attributedString.addAttribute(.underlineStyle, value: 1, range: range)
//        attributedString.addAttribute(.foregroundColor, value: UIColor.yellow, range: range)
        attributedString.addAttribute(.link, value: attributedTextModel.link, range: range)
        textView.attributedText = attributedString
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        func textView(_ textView: UITextView, shouldInteractWith URL: URL,
                      in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
            UIApplication.shared.open(URL)
            return false
        }
    }
}
