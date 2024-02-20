//
//  CalculatorResultsPresenter.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 2.01.2024.
//

import Foundation
import InstallmentCalculator

class CalculationResultsPresenter {
    private let calculator: Calculator
    private let installments: [Installment]
    
    init(calculator: Calculator, installments: [Installment]) {
        self.calculator = calculator
        self.installments = installments
    }

    var presentableResult: PresentableResult {
        let result = calculator.calculate(installments: installments)
        return PresentableResult(
            totalAmount: "$\(formatDoubleToString(result.totalAmount))",
            currentlyPaying: "$\(formatDoubleToString(result.monthlyTotal))",
            remainingMonths: "\(result.totalRemainingMonths)"
        )
    }
    
    var presentableInstallments: [PresentableInstallment] {
        installments.map { $0.presentable }
    }

    private func formatDoubleToString(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = number.truncatingRemainder(dividingBy: 1) == 0 ? 0 : 2
        formatter.minimumFractionDigits = formatter.maximumFractionDigits
        formatter.roundingMode = .halfUp
        formatter.numberStyle = .decimal

        if let formattedString = formatter.string(from: NSNumber(value: number)) {
            return formattedString
        } else {
            return "\(number)"
        }
    }
}
