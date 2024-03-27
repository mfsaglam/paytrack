//
//  New.swift
//  CalculatorAppTests
//
//  Created by Fatih Sağlam on 1.01.2024.
//

import XCTest
import InstallmentCalculator
@testable import CalculatorApp

final class CalculationResultsPresenterTests: XCTestCase {
//    func test_presentableResult_returnsEmptyWhenInstallmentsAreEmpty() {
//        let sut = makeSUT(installments: [])
//
//        let expectedPresentableResult = PresentableResult(
//            totalAmount: "$0",
//            currentlyPaying: "$0",
//            remainingMonths: "0"
//        )
//
//        XCTAssertEqual(sut.presentableResult, expectedPresentableResult)
//    }
    
    func test_presentableResult_totalAmount_formatsNonDecimalCorrectly() {
        let sut = makeSUT(installments: [
            makeInstallment(months: 12, monthlyPayment: 100)
        ])

        XCTAssertEqual(sut.presentableResult.totalAmount, "$1.200")
    }
    
    func test_presentableResult_totalAmount_formatsDecimalCorrectly() {
        let sut = makeSUT(installments: [
            makeInstallment(months: 12, monthlyPayment: 100.20)
        ])

        XCTAssertEqual(sut.presentableResult.totalAmount, "$1.202,40")
    }
    
    func test_presentableResult_totalAmount_formatsMoreThanTwoDecimalsCorrectly() {
        let sut = makeSUT(installments: [
            makeInstallment(months: 12, monthlyPayment: 100.202)
        ])

        XCTAssertEqual(sut.presentableResult.totalAmount, "$1.202,42")
    }
    
    func test_presentableResult_currentlyPaying_formatsNonDecimalCorrectly() {
        let sut = makeSUT(installments: [
            makeInstallment(months: 12, monthlyPayment: 100)
        ])

        XCTAssertEqual(sut.presentableResult.currentlyPaying, "$100")
    }
    
    func test_presentableResult_currentlyPaying_formatsDecimalCorrectly() {
        let sut = makeSUT(installments: [
            makeInstallment(months: 12, monthlyPayment: 100.20)
        ])

        XCTAssertEqual(sut.presentableResult.currentlyPaying, "$100,20")
    }
    
    func test_presentableResult_currentlyPaying_formatsMoreThanTwoDecimalsCorrectly() {
        let sut = makeSUT(installments: [
            makeInstallment(months: 12, monthlyPayment: 100.202)
        ])

        XCTAssertEqual(sut.presentableResult.currentlyPaying, "$100,20")
    }
    
    func test_presentableResult_remainingMonths_formatsCorrectly() {
        let sut = makeSUT(installments: [
            makeInstallment(months: 12),
            makeInstallment(months: 3)
        ])

        XCTAssertEqual(sut.presentableResult.remainingMonths, "12")
    }
    
    private func makeSUT(installments: [Installment]) -> CalculationResultsPresenter {
        let calculator = Calculator()
        return CalculationResultsPresenter(calculator: calculator, installments: installments)
    }
}

extension PresentableResult: Equatable {
    public static func == (lhs: PresentableResult, rhs: PresentableResult) -> Bool {
        lhs.currentlyPaying == rhs.currentlyPaying &&
        lhs.remainingMonths == rhs.remainingMonths &&
        lhs.totalAmount == rhs.remainingMonths
    }
}
