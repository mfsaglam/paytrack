//
//  Date+Extension.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation

extension Date {
    /// Returns the amount of months from another date
    func months(from date: Date) -> Int {
        return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
    }
}
