//
//  CustomViewModifiers.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

struct JPTextfieldStyle: ViewModifier {
    
    init() { UITextField.appearance().clearButtonMode = .whileEditing }
    
    func body(content: Content) -> some View {
        content
            .applyJPBody(.App.accent)
            .autocorrectionDisabled(true)
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.gray)
    }
}

struct JPHeaderStyle: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(BaskervilleFont.italic, size: 38, relativeTo: .largeTitle))
            .kerning(1.2)
            .foregroundStyle(color)
    }
}


struct JPSubheaderStyle: ViewModifier {
    
    var color: Color

    func body(content: Content) -> some View {
        content
            .font(.custom(BaskervilleFont.italic, size: 30, relativeTo: .subheadline))
            .kerning(1.2)
            .foregroundStyle(color)
    }
}
                  
struct JPBodyStyle: ViewModifier {
    
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.custom(UniversFont.light, size: 16, relativeTo: .body))
            .kerning(1.2)
            .foregroundStyle(color)
    }
}

struct JPFootnoteStyle: ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.custom(UniversFont.light, size: 16, relativeTo: .footnote))
            .foregroundStyle(.secondary)
    }
}
