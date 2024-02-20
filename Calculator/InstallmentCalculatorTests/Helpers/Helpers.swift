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
        id: UUID(),
        name: "",
        monthlyPayment: monthlyPayment,
        months: months,
        startingDate: startingDate.date,
        paymentDay: paymentDay
    )
    
    return installment
}

extension CalculationResult: Equatable {
    public static func == (lhs: CalculationResult, rhs: CalculationResult) -> Bool {
        return lhs.monthlyTotal == rhs.monthlyTotal &&
        lhs.totalAmount == rhs.totalAmount &&
        lhs.totalNumber == rhs.totalNumber &&
        lhs.totalRemainingMonths == rhs.totalRemainingMonths
    }
}

extension Installment: Equatable {
    public static func == (lhs: Installment, rhs: Installment) -> Bool {
        return lhs.monthlyPayment == rhs.monthlyPayment &&
        lhs.months == rhs.months &&
        lhs.startingDate == rhs.startingDate &&
        lhs.paymentDay == rhs.paymentDay
    }
}
