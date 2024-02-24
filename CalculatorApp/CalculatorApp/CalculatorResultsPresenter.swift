//
//  CalculatorResultsPresenter.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 2.01.2024.
//

import Foundation
import InstallmentCalculator

class CalculationResultsPresenter {
    let interactor: CalculationResultsInteractorProtocol
    private let calculator: Calculator
    
    init(calculator: Calculator, interactor: CalculationResultsInteractorProtocol) {
        self.calculator = calculator
        self.interactor = interactor
    }
    
    func presentResults() async throws -> (PresentableResult, [PresentableInstallment]) {
        let installments = try await interactor.loadInstallments()
        let result = self.calculator.calculate(installments: installments)
        let presentableResult = PresentableResult(
            totalAmount: "$\(self.formatDoubleToString(result.totalAmount))",
            currentlyPaying: "$\(self.formatDoubleToString(result.monthlyTotal))",
            remainingMonths: "\(result.totalRemainingMonths)"
        )
        
        let presentableInstallments = installments.map { $0.presentable }

        return (presentableResult, presentableInstallments)
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
