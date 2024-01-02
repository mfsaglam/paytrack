//
//  CalculatorResultsPresenter.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 2.01.2024.
//

import Foundation
import InstallmentCalculator

class CalculationResultsPresenter: CalculatorDelegate {
    var presentableResult: PresentableResult =
        .init(
            totalAmount: "",
            currentlyPaying: "",
            remainingMonths: ""
        )
    
    func result(_ result: CalculationResult) {
        presentableResult.totalAmount = "$\(formatDoubleToString(result.totalAmount))"
        presentableResult.currentlyPaying = "$\(formatDoubleToString(result.monthlyTotal))"
        presentableResult.remainingMonths = "\(result.totalRemainingMonths)"
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
