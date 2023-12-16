//
//  Helpers.swift
//  InstallmentCalculatorTests
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation

enum InstallmentTestDate: TimeInterval {
    case tomorrow = 86400 // 24 hours
    case threeMonthsAgo = -7862401 // -91 days
    case threeDaysFromNow = 259200 // 3 days
    
    var date: Date {
        return Date().addingTimeInterval(rawValue)
    }
}
