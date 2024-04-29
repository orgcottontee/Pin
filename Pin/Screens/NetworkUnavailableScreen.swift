//
//  NetworkUnavailableScreen.swift
//  JingPin
//
//  Created by adobada on 4/26/24.
//

import SwiftUI

struct NetworkUnavailableScreen: View {
    var body: some View {
        ZStack {
            Color(.App.background).ignoresSafeArea()
            ContentUnavailableView(NetworkUnavailableConstant.title,
                                   systemImage:  NetworkUnavailableConstant.icon,
                                   description: Text(NetworkUnavailableConstant.description))
        }
    }
}

#Preview {
    NetworkUnavailableScreen()
}
