//
//  Helpers.swift
//  InstallmentCalculatorTests
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation
@testable import InstallmentCalculator

enum InstallmentTestDate: TimeInterval {
    case tomorrow = 86400 // 24 hours
    case threeMonthsAgo = -7862401 // -91 days
    
    var date: Date {
        return Date().addingTimeInterval(rawValue)
    }
}

func makeInstallment(
    months: Int = 1,
    monthlyPayment: Double = 1,
    startingDate: InstallmentTestDate = .tomorrow,
    paymentDay: Int = 1
) -> Installment {
    let installment = Installment(
        monthlyPayment: monthlyPayment,
        months: months,
        startingDate: startingDate.date,
        paymentDay: paymentDay
    )
    
    return installment
}
