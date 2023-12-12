//
//  Calculator.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 11.12.2023.
//

import Foundation

struct Installment {
    var monthlyPayment: Double
    var months: Int
    var paymentDate: Date?

    init(monthlyPayment: Double = 0, months: Int = 0, dateAdded: Date? = nil) {
        self.monthlyPayment = monthlyPayment
        self.months = months
        self.paymentDate = dateAdded
    }
}

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

protocol CalculatorDelegate {
    func result(_ result: CalculationResult)
}

class Calculator {
    let delegate: CalculatorDelegate

    init(delegate: CalculatorDelegate) {
        self.delegate = delegate
    }

    func calculate(installments: [Installment]) {
        if !installments.isEmpty {
            let result = calculateResult(for: installments)
            delegate.result(result)
        }
    }

    private func calculateResult(for installments: [Installment]) -> CalculationResult {
        let filteredInstallments = filterPastInstallments(installments)

        var result = CalculationResult()
        result.monthlyTotal = filteredInstallments.reduce(0) { $0 + $1.monthlyPayment }
        result.totalAmount = filteredInstallments.reduce(0) { $0 + ($1.monthlyPayment * Double($1.months)) }
        result.totalNumber = filteredInstallments.count

        return result
    }

    private func filterPastInstallments(_ installments: [Installment]) -> [Installment] {
        let currentDate = Date()

        return installments.filter { installment in
            guard let dateAdded = installment.paymentDate else {
                return true // Treat installments without dateAdded as past
            }

            return dateAdded >= currentDate
        }
    }
}
