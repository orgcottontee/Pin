//
//  UserSubmissionViewModel.swift
//  JingPin
//
//  Created by adobada on 4/15/24.
//

import Foundation
import CloudKit

@Observable
final class UserSubmissionViewModel {
    
    // MARK: - Properties
    
    var boutiqueName: String = ""
    var country: String = ""
    var website: String = ""
    
    var hasAlert: Bool = false
    var hasError: Bool = false
    var isLoading: Bool = false
    
    var jingPinError: JingPinError?
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
            hasError = true
            jingPinError = .incompleteForm
            return
        }
        
        Task {
            do {
                let submission = UserBoutiqueSubmission(name: boutiqueName, country: country, website: website)
                try await container.save(submission.record)
                showLoadingView()
                hasAlert = true
                hideLoadingView()
                boutiqueName = ""
                country = ""
                website = ""
            } catch {
                hasError = true
                jingPinError = .submissionFailed
                print("-----\(error.localizedDescription)-----")
            }
        }
    }
    
    private func showLoadingView() { isLoading = true }
    private func hideLoadingView() { isLoading = false }
    
}
