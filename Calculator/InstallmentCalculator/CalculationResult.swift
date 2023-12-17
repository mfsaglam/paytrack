//
//  CalculationResult.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation

struct CalculationResult {
    var totalNumber: Int
    var monthlyTotal: Double
    var totalAmount: Double

    init(totalNumber: Int = 0, monthlyTotal: Double = 0, totalAmount: Double = 0) {
        self.totalNumber = totalNumber
        self.monthlyTotal = monthlyTotal
        self.totalAmount = totalAmount
    }
}
