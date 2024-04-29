//
//  NetworkMonitor.swift
//  JingPin
//
//  Created by adobada on 4/25/24.
//

import Foundation
import Network

class NetworkMonitor: ObservableObject {
    private let networkMonitor: NWPathMonitor = NWPathMonitor()
    private let workerQueue:DispatchQueue = DispatchQueue(label: "Monitor")
    
    var isConnected: Bool = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            Task {
                await MainActor.run {
                    self.objectWillChange.send()
                }
            }
        }
        networkMonitor.start(queue: workerQueue)
    }
}
