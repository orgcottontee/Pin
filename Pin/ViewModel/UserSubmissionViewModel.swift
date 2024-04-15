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
    private let container: CKDatabase = CKContainer.default().publicCloudDatabase
  
//    private var submissionDictionary: [CKRecord.ID: UserBoutiqueSubmission] = [:]
       
    // MARK: - Actions
    
    private func isCompletedForm() -> Bool {
        guard !boutiqueName.isEmpty, 
                !country.isEmpty,
                !website.isEmpty else { return false }
        return true
    }
    
    func submitSubmission() async throws {
        guard isCompletedForm() else {
            alertItem = AlertContext.incompleteForm
            return
        }
        let submission = UserBoutiqueSubmission(name: boutiqueName, country: country, website: website)
        try await container.save(submission.record)
    }
    
    
    // TODO: - populateSubmissions will pull all submissions from every user since it is in the public database. I still need it in the public so I can see it and add to the app. How can I simplify it so that it just persists the boutique name text in a list? Maybe I can use userdefaults for this and when they save an existing boutique from CloudKit in their favorites
    
//    func populateSubmissions() async throws {
//        
//        let query = CKQuery(recordType: RecordType.userSubmission, predicate: NSPredicate(value: true))
//        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
//        let result = try await container.records(matching: query)
//        let records = result.matchResults.compactMap { try? $0.1.get() }
//        
//        records.forEach { record in
//            submissionDictionary[record.recordID] = UserBoutiqueSubmission(record: record)
//        }
//    }
}
