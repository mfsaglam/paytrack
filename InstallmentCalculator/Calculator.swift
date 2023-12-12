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
    var dateAdded: Date?
    
    init(
        monthlyPayment: Double = 0,
        months: Int = 0,
        dateAdded: Date? = nil
    ) {
        self.monthlyPayment = monthlyPayment
        self.months = months
        self.dateAdded = dateAdded
    }
}

struct CalculationResult {
    var totalNumber: Int
    var monthlyTotal: Double
    var totalAmount: Double
    
    init(
        totalNumber: Int = 0,
        monthlyTotal: Double = 0,
        totalAmount: Double = 0
    ) {
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
    
    private func calculateResult(
        for installments: [Installment]
    ) -> CalculationResult {
        var result = CalculationResult()
        result.monthlyTotal = installments.reduce(0, { partialResult, installment in
            partialResult + installment.monthlyPayment
        })
        result.totalAmount = installments.reduce(0, { partialResult, installment in
            partialResult + (installment.monthlyPayment * Double(installment.months))
        })
        result.totalNumber = installments.count
        return result
    }
}
