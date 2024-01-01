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
    var totalRemainingMonths: Int

    init(
        totalNumber: Int = 0,
        monthlyTotal: Double = 0,
        totalAmount: Double = 0,
        totalRemainingMonths: Int = 0
    ) {
        self.totalNumber = totalNumber
        self.monthlyTotal = monthlyTotal
        self.totalAmount = totalAmount
        self.totalRemainingMonths = totalRemainingMonths
    }
}
