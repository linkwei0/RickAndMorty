//
//  UIFont+AppFonts.swift
//  RickAndMorty
//
//  Created by Артём Бацанов on 05.11.2023.
//

import UIKit

extension UIFont {
    static let appRegular = UIFont.systemFont(ofSize: 16)
    static let appBold = UIFont.boldSystemFont(ofSize: 16)
    
    static let header1 = scaledFont(for: appBold.withSize(32), textStyle: .title1)
    static let header2 = scaledFont(for: appBold.withSize(24), textStyle: .title2)
    static let body = scaledFont(for: appRegular.withSize(16), textStyle: .body)
    static let bodyBold = scaledFont(for: appBold.withSize(16), textStyle: .body)
    static let footnote = scaledFont(for: appRegular.withSize(12), textStyle: .footnote)
    static let footnoteBold = scaledFont(for: appBold.withSize(12), textStyle: .footnote)
    static let smallFootnote = scaledFont(for: appRegular.withSize(10), textStyle: .caption2)
    
    static func scaledFont(for font: UIFont?, textStyle: UIFont.TextStyle) -> UIFont? {
        guard let font = font else { return nil }
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
}
