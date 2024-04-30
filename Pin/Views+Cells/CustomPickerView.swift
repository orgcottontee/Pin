//
//  CustomPickerView.swift
//  JingPin
//
//  Created by adobada on 4/29/24.
//

import SwiftUI

struct CustomPickerView: View {
    
    @Binding var selectedState: USState
    private let rows = [GridItem(.fixed(30))]
    private let states = USState.allCases
    
    var body: some View {
        
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(states) { stateName in
                    Button {
                        withAnimation {
                            selectedState = stateName
                        }
                    } label: {
                        ZStack {
                            Capsule()
                                .fill(Color.App.accent)
                            Text(stateName.state)
                                .applyJPBody(.App.background)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .frame(height: 60)
        }
        .scrollIndicators(.hidden)
        
    }
}

#Preview {
    CustomPickerView(selectedState: .constant(.california))
}
