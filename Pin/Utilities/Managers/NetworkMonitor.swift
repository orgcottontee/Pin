//
//  NetworkMonitor.swift
//  JingPin
//
//  Created by adobada on 4/25/24.
//

import Foundation
import Network

@Observable
class NetworkMonitor {
    private let networkMonitor: NWPathMonitor = NWPathMonitor()
    private let workerQueue:DispatchQueue = DispatchQueue(label: "Monitor")
    
    var isConnected: Bool = false
    
    init() {
        networkMonitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        networkMonitor.start(queue: workerQueue)
    }
}
