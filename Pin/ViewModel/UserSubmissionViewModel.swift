//
//  UserSubmissionViewModel.swift
//  JingPin
//
//  Created by adobada on 4/15/24.
//

import Foundation
import CloudKit

// TODO: Refactor & create alert if submission suceeds and/or fails

final class UserSubmissionViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var boutiqueName: String = ""
    @Published var country: String = ""
    @Published var website: String = ""
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    private let container: CKDatabase = CKContainer.default().publicCloudDatabase
    
    // MARK: - Actions
    
    private func isCompletedForm() -> Bool {
        guard !boutiqueName.isEmpty,
              !country.isEmpty,
              !website.isEmpty else { return false }
        return true
    }
    
    @MainActor
    func submitSubmission() {
        guard isCompletedForm() else {
            alertItem = AlertContext.incompleteForm
            return
        }
        
        Task {
            do {
                let submission = UserBoutiqueSubmission(name: boutiqueName, country: country, website: website)
                try await container.save(submission.record)
                showLoadingView()
                alertItem = AlertContext.submissionSuccess
                hideLoadingView()
            } catch {
                hideLoadingView()
                alertItem = AlertContext.submissionFail
            }
        }
    }
    
    private func showLoadingView() { isLoading = true }
    private func hideLoadingView() { isLoading = false }
    
}
