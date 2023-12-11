//
//  CalculatorTest.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 11.12.2023.
//

import Foundation
import XCTest
@testable import InstallmentCalculator

class CalculatorTest: XCTestCase {
    private let delegate = CalculatorDelegateSpy()

    func test_calculate_withNoInstallments_doesNotSendResult() {
        let sut = makeSUT(delegate: delegate)
        
        sut.calculate(installments: [])
        
        XCTAssertEqual(delegate.receivedResultsCount, 0)
    }
    
    func test_calculate_withOneInstallment_sendsTheResult() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1)
        ])

        XCTAssertEqual(delegate.receivedResultsCount, 1)
    }
    
    func test_calculate_withOneInstallment_sendsTheCorrectResult() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1)
        ])
        
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOneInstallment_sendsTheCorrectResult_2() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1)
        ])
        
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withTwoInstallments_sendsTheCorrectResult() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1),
            .init(monthlyPayment: 2, months: 2)
        ])
        
        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 3, totalAmount: 5)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(delegate: CalculatorDelegate) -> Calculator {
        Calculator(delegate: delegate)
    }
    
    private class CalculatorDelegateSpy: CalculatorDelegate {
        var receivedResultsCount: Int = 0
        var calculationResult: CalculationResult? = nil
        
        func result(_ result: InstallmentCalculator.CalculationResult) {
            receivedResultsCount += 1
            calculationResult = result
        }
    }
}

extension CalculationResult: Equatable {
    public static func == (lhs: CalculationResult, rhs: CalculationResult) -> Bool {
        return lhs.monthlyTotal == rhs.monthlyTotal &&
        lhs.totalAmount == rhs.totalAmount &&
        lhs.totalNumber == rhs.totalNumber
    }
}

