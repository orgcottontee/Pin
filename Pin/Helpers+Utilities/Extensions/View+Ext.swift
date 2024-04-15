//
//  View+Ext.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI

extension View {
    
    func applyJPTextfield() -> some View {
        modifier(JPTextfieldStyle())
    }
    
    func applyJPHeader() -> some View {
        modifier(JPHeaderStyle())
    }
    
    func applyJPSubheader() -> some View {
        modifier(JPSubheaderStyle())
    }
    
    func applyJPBody() -> some View {
        modifier(JPBodyStyle())
    }
    
    func applyJPFootnote() -> some View {
        modifier(JPFootnoteStyle())
    }
}
