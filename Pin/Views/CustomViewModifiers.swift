//
//  CustomViewModifiers.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

struct OnFirstAppear: ViewModifier {
    let action: (() -> Void)?
    
    @State private var hasAppeared = false
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                guard !hasAppeared else { return }
                hasAppeared = true
                action?()
            }
    }
}

struct JPTextfieldStyle: ViewModifier {
        
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
            .font(.custom(BaskervilleFont.italic, size: 38, relativeTo: .title))
            .kerning(1.2)
            .foregroundStyle(color)
    }
}


struct JPSubheaderStyle: ViewModifier {
    
    var color: Color

    func body(content: Content) -> some View {
        content
            .font(.custom(BaskervilleFont.italic, size: 30, relativeTo: .title2))
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
