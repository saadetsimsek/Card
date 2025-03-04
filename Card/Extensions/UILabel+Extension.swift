//
//  UILabel+Extension.swift
//  Card
//
//  Created by Saadet Şimşek on 04/03/2025.
//

import UIKit

extension UILabel {
    func setLineHeight(lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributedString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            
            style.lineSpacing = lineHeight
            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                          value: style,
                                          range: NSMakeRange(0, text.count))
            self.attributedText = attributedString
        }
    }
}
