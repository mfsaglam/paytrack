//
//  Calculator.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 11.12.2023.
//

import Foundation

public protocol CalculatorDelegate {
    func result(_ result: CalculationResult)
}

class Calculator {
    let filterer = InstallmentFilterer()
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
        let filteredInstallments = filterer.filterPastInstallments(installments)

        var result = CalculationResult()
        result.monthlyTotal = filteredInstallments.reduce(0) { $0 + $1.monthlyPayment }
        result.totalAmount = filteredInstallments.reduce(0) { $0 + ($1.monthlyPayment * Double($1.remainingMonths)) }
        result.totalNumber = filteredInstallments.count
        result.totalRemainingMonths = filteredInstallments.map { $0.remainingMonths }.max() ?? 0

        return result
    }
}
