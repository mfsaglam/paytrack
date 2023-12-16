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
    var startingDate: Date
    
    var remainingMonths: Int {
        let passedMonths = Date().months(from: startingDate)
        return months - passedMonths
    }
    
    var remainingAmount: Double {
        Double(remainingMonths) * monthlyPayment
    }

    init(monthlyPayment: Double, months: Int, startingDate: Date) {
        self.monthlyPayment = monthlyPayment
        self.months = months
        self.startingDate = startingDate
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
        result.totalAmount = filteredInstallments.reduce(0) { $0 + ($1.monthlyPayment * Double($1.remainingMonths)) }
        result.totalNumber = filteredInstallments.count

        return result
    }

    private func filterPastInstallments(_ installments: [Installment]) -> [Installment] {
        return installments.filter { installment in
            return installment.remainingMonths > 0
        }
    }
}
