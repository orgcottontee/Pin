//
//  Date+Ext.swift
//  JingPin
//
//  Created by adobada on 4/22/24.
//

import Foundation

extension Date {
    
    func convertToWeekdayDayMonth() -> String {
        return formatted(date: .long, time: .omitted)
    }
}
