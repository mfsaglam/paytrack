//
//  Calculator.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 11.12.2023.
//

import Foundation

public class Calculator {
    let filterer = InstallmentFilterer()
    
    public init() {}

    func calculate(installments: [Installment]) -> CalculationResult {
        let filteredInstallments = filterer.filterPastInstallments(installments)
        
        var result = CalculationResult()
        result.monthlyTotal = filteredInstallments.reduce(0) { $0 + $1.monthlyPayment }
        result.totalAmount = filteredInstallments.reduce(0) { $0 + ($1.monthlyPayment * Double($1.remainingMonths)) }
        result.totalNumber = filteredInstallments.count
        result.totalRemainingMonths = filteredInstallments.map { $0.remainingMonths }.max() ?? 0
        return result
    }
}
