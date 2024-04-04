//
//  TabBarView.swift
//  Pin
//
//  Created by adobada on 4/3/24.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var selected: Constants.TabIcon

    var body: some View {
        HStack {
            ForEach(Constants.TabIcon.allCases, id: \.rawValue) { tab in
                Spacer()
                Button {
                    selected = tab
                } label: {
                    Image(systemName: selected == tab ? tab.selected : tab.unselected)
                        .frame(width: 60, height: 40)
                        .scaleEffect(selected == tab ? 1.40 : 1.0)
                        .foregroundStyle(.brandAccent)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.2)) {
                                selected = tab
                            }
                        }
                }
                Spacer()
            }
        }
    }
}

#Preview {
    TabBarView(selected: .constant(.door))
}
