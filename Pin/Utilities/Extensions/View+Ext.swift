//
//  View+Ext.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

extension View {
    
    func applyOnFirstAppear(perform action: (() -> Void)? = nil) -> some View {
      modifier(OnFirstAppear(action: action))
    }
    
    func applyJPTextfield() -> some View {
        modifier(JPTextfieldStyle())
    }
    
    func applyJPHeader(_ color: Color) -> some View {
        modifier(JPHeaderStyle(color: color))
    }
    
    func applyJPSubheader(_ color: Color) -> some View {
        modifier(JPSubheaderStyle(color: color))
    }
    
    func applyJPBody(_ color: Color) -> some View {
        modifier(JPBodyStyle(color: color))
    }
    
    func applyJPFootnote() -> some View {
        modifier(JPFootnoteStyle())
    }
}
