//
//  New.swift
//  CalculatorAppTests
//
//  Created by Fatih Sağlam on 1.01.2024.
//

import XCTest
@testable import InstallmentCalculator

struct PresentableResult {
    var totalAmount: String
    var currentlyPaying: String
    var remainingMonths: String
}

class CalculationResultsPresenter: CalculatorDelegate {
    var presentableResult: PresentableResult =
        .init(
            totalAmount: "",
            currentlyPaying: "",
            remainingMonths: ""
        )
    
    func result(_ result: InstallmentCalculator.CalculationResult) {
        presentableResult.totalAmount = "$\(formatDoubleToString(result.totalAmount))"
        presentableResult.currentlyPaying = "$\(formatDoubleToString(result.monthlyTotal))"
        presentableResult.remainingMonths = "\(result.totalNumber)"
    }
    
    func formatDoubleToString(_ number: Double) -> String {
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

final class CalculationResultsPresenterTests: XCTestCase {
    
    func test_presentableResult_returnsNilWhenResultIsEmpty() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(installments: [])
        let expectedPresentableResult = PresentableResult(
            totalAmount: "",
            currentlyPaying: "",
            remainingMonths: ""
        )
        
        XCTAssertEqual(sut.presentableResult, expectedPresentableResult)
    }
    
    func test_presentableResult_totalAmount_formatsNonDecimalCorrectly() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(
            installments: [
                makeInstallment(months: 12, monthlyPayment: 100, startingDate: .tomorrow, paymentDay: 5)
            ]
        )

        XCTAssertEqual(sut.presentableResult.totalAmount, "$1,200")
    }
    
    func test_presentableResult_totalAmount_formatsDecimalCorrectly() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(
            installments: [
                makeInstallment(months: 12, monthlyPayment: 100.20, startingDate: .tomorrow, paymentDay: 5)
            ]
        )

        XCTAssertEqual(sut.presentableResult.totalAmount, "$1,202.40")
    }
    
    func test_presentableResult_totalAmount_formatsMoreThanTwoDecimalsCorrectly() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(
            installments: [
                makeInstallment(months: 12, monthlyPayment: 100.202, startingDate: .tomorrow, paymentDay: 5)
            ]
        )

        XCTAssertEqual(sut.presentableResult.totalAmount, "$1,202.42")
    }
    
    func test_presentableResult_currentlyPaying_formatsNonDecimalCorrectly() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(
            installments: [
                makeInstallment(months: 12, monthlyPayment: 100, startingDate: .tomorrow, paymentDay: 5)
            ]
        )

        XCTAssertEqual(sut.presentableResult.currentlyPaying, "$100")
    }
    
    func test_presentableResult_currentlyPaying_formatsDecimalCorrectly() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(
            installments: [
                makeInstallment(months: 12, monthlyPayment: 100.20, startingDate: .tomorrow, paymentDay: 5)
            ]
        )

        XCTAssertEqual(sut.presentableResult.currentlyPaying, "$100.20")
    }
    
    func test_presentableResult_currentlyPaying_formatsMoreThanTwoDecimalsCorrectly() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(
            installments: [
                makeInstallment(months: 12, monthlyPayment: 100.202, startingDate: .tomorrow, paymentDay: 5)
            ]
        )

        XCTAssertEqual(sut.presentableResult.currentlyPaying, "$100.20")
    }
    
    func test_presentableResult_remainingMonths_formatsCorrectly() {
        let (sut, calculator) = makeSUT()
        calculator.calculate(
            installments: [
                makeInstallment(months: 12, monthlyPayment: 100.202, startingDate: .tomorrow, paymentDay: 5)
            ]
        )

        XCTAssertEqual(sut.presentableResult.remainingMonths, "12")
    }
    
    private func makeSUT() -> (CalculationResultsPresenter, Calculator) {
        let sut = CalculationResultsPresenter()
        let calculator = Calculator(delegate: sut)
        return (sut, calculator)
    }
}

extension PresentableResult: Equatable {
    
}
