//
//  SFSymbolView.swift
//  JingPin
//
//  Created by adobada on 4/19/24.
//

import SwiftUI

struct SFSymbolView: View {
    
    var icon: String
    
    var body: some View {
        Image(systemName: icon)
            .applyJPSubheader()
            .frame(width: 44, height: 44)
    }
}

#Preview {
    SFSymbolView(icon: "heart")
}
