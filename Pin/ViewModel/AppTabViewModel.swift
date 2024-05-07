//
//  AppTabViewModel.swift
//  JingPin
//
//  Created by adobada on 5/7/24.
//

import SwiftUI
import CloudKit
    
final class AppTabViewModel: ObservableObject {
    
    @Published var isShowingOnboardingView: Bool = false

    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding = false {
        didSet { isShowingOnboardingView = hasSeenOnboarding }
    }
    
    @MainActor
    func checkIfHasSeenOnboard() {
        if !hasSeenOnboarding { hasSeenOnboarding = true }
    }
}
