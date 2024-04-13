//
//  UserSubmissionScreen.swift
//  JingPin
//
//  Created by adobada on 4/12/24.
//

import SwiftUI
import CloudKit

struct UserSubmissionScreen: View {
    
    @FocusState private var focusTextfield: FocusTextField?
    @State private var boutiqueName = ""
    @State private var country = ""
    @State private var website = ""
    @StateObject private var manager = UserSubmissionManager()
    @State private var hasSubmitted: Bool = false
    
    enum FocusTextField {
        case name, country, website
    }
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Spacer()
                Text("We're always looking to expand our collection for you. Please share boutiques you'd like us to add:")
                    .font(.custom(BaskervilleFont.regular, size: 14))
                    .kerning(1.5)
                    .padding()
                TextField("Enter Boutique Name", text: $boutiqueName)
                    .focused($focusTextfield, equals: .name)
                    .onSubmit { focusTextfield = .country }
                    .submitLabel(.next)
                    .createCustomTextfield()
                TextField("Enter Country", text: $country)
                    .focused($focusTextfield, equals: .country)
                    .onSubmit { focusTextfield = .website }
                    .submitLabel(.next)
                    .createCustomTextfield()
                TextField("Enter Website", text: $website)
                    .focused($focusTextfield, equals: .website)
                    .submitLabel(.done)
                    .onSubmit { submitSubmission() }
                    .createCustomTextfield()
                
                Button {
                    let submission = UserBoutiqueSubmission(name: boutiqueName, country: country, website: website)
                    Task {
                        try await manager.addUserSubmission(submission: submission)
                    }
                    hasSubmitted = true
                } label: {
                    ActionButtonView(buttonText: "Submit")
                        .padding(.vertical)
                }
            }
            .padding(.horizontal)
        }
    }
    
    func submitSubmission() {
        // Add logic to send to CloudKit
        focusTextfield = nil
    }
}

#Preview {
    UserSubmissionScreen()
}

@MainActor
final class UserSubmissionManager: ObservableObject {
    
    private let container = CKContainer.default().publicCloudDatabase
    @Published private var submissionDictionary: [CKRecord.ID: UserBoutiqueSubmission] = [:]
    var submissions: [UserBoutiqueSubmission] {
        submissionDictionary.values.compactMap { $0 }
    }
    
    func addUserSubmission(submission: UserBoutiqueSubmission) async throws {
        let _ = try await container.save(submission.record)
    }
    // This will pull all submissions from every user since it is in the public database. I still need it in the public so I can see it and add to the app. How can I simplify it so that it just persists the boutique name text in a list? Maybe I can use userdefaults for this and when they save an existing boutique from CloudKit in their favorites
    
    func populateSubmissions() async throws {
        
        let query = CKQuery(recordType: RecordType.userSubmission, predicate: NSPredicate(value: true))
        query.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        let result = try await container.records(matching: query)
        let records = result.matchResults.compactMap { try? $0.1.get() }
        
        records.forEach { record in
            submissionDictionary[record.recordID] = UserBoutiqueSubmission(record: record)
        }
    }
    
}
