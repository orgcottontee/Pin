//
//  CustomViewModifiers.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

struct JPTextfieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .applyJPBody()
            .autocorrectionDisabled(true)
            .padding(.horizontal)
            .padding(.top, 20)
        Rectangle()
            .frame(height: 1)
            .padding(.horizontal)
            .foregroundColor(.gray)
    }
}

struct JPHeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(BaskervilleFont.italic, size: 30, relativeTo: .largeTitle))
            .kerning(1.2)
            .foregroundStyle(.appAccent)
    }
}

struct JPSubheaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(BaskervilleFont.italic, size: 30, relativeTo: .subheadline))
            .kerning(1.2)
            .foregroundStyle(.appAccent)
    }
}
                  
struct JPBodyStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(UniversFont.light, size: 16, relativeTo: .body))
            .kerning(1.2)
            .foregroundStyle(.appAccent)
    }
}

struct JPFootnoteStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom(UniversFont.light, size: 16, relativeTo: .footnote))
            .kerning(1.2)
            .foregroundStyle(.appAccent)
    }
}
