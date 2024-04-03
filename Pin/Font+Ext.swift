//
//  Font+Ext.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

extension Font {
    static func custom(_ font: BaskervilleFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}

extension Font {
    static func custom(_ font: UniversFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
