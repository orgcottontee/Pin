//
//  CustomPickerView.swift
//  JingPin
//
//  Created by adobada on 4/29/24.
//

import SwiftUI

struct USStatePickerView: View {
    
    private let rows = [GridItem(.fixed(30))]
    private let states = USState.allCases
    @Binding var selectedState: USState
    @Binding var isSearchTextfieldVisible: Bool
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, spacing: 14) {
                ForEach(states) { stateName in
                    Button {
                        withAnimation {
                            selectedState = stateName
                            isSearchTextfieldVisible = false
                        }
                    } label: {
                        ZStack {
                            Capsule()
                                .fill(selectedState == stateName ? Color.App.accent : Color.secondary)
                                .frame(height: dynamicTypeSize >= .accessibility3 ? 200 : 40)
                            Text(stateName.state)
                                .applyJPBody(.App.background)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .frame(height: 44)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    USStatePickerView(selectedState: .constant(.california), isSearchTextfieldVisible: .constant(true))
}
