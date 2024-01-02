//
//  Helpers.swift
//  InstallmentCalculatorTests
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation
@testable import InstallmentCalculator

enum InstallmentTestDate: TimeInterval {
    case tomorrow
    case threeMonthsAgo
    
    var date: Date {
        switch self {
        case .threeMonthsAgo:
            return Calendar.current.date(byAdding: .month, value: -3, to: Date())!
        case .tomorrow:
            return Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        }
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
