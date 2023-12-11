//
//  Calculator.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 11.12.2023.
//

import Foundation

struct Installment {
    let monthlyPayment: Double
    let months: Int
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
            var result = CalculationResult()
            result.monthlyTotal = installments.reduce(0, { partialResult, installment in
                partialResult + installment.monthlyPayment
            })
            result.totalAmount = installments.reduce(0, { partialResult, installment in
                partialResult + (installment.monthlyPayment * Double(installment.months))
            })
            result.totalNumber = installments.count
            delegate.result(result)
        }
    }
}
