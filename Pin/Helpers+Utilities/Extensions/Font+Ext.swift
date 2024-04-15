//
//  Font+Ext.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

extension Font {
    static func custom(_ name: BaskervilleFont, size: CGFloat, relativeTo: TextStyle) -> SwiftUI.Font {
        SwiftUI.Font.custom(name.rawValue, size: size, relativeTo: relativeTo)
    }
}

extension Font {
    static func custom(_ name: UniversFont, size: CGFloat, relativeTo: TextStyle) -> SwiftUI.Font {
        SwiftUI.Font.custom(name.rawValue, size: size, relativeTo: relativeTo)
    }
}
