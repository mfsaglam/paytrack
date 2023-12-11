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
    func test_calculate_withNoInstallments_doesNotSendResult() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)
        
        sut.calculate(installments: [])
        
        XCTAssertEqual(delegate.receivedResultsCount, 0)
    }
    
    func test_calculate_withOneInstallment_sendsTheResult() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1)
        ])

        XCTAssertEqual(delegate.receivedResultsCount, 1)
    }
    
    func test_calculate_withOneInstallment_sendsTheCorrectResult() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1)
        ])

        XCTAssertEqual(delegate.calculationResult, .init(totalNumber: 1, monthlyTotal: 1, totalAmount: 1))
    }
    
    func test_calculate_withOneInstallment_sendsTheCorrectResult_2() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1)
        ])

        XCTAssertEqual(delegate.calculationResult, .init(totalNumber: 1, monthlyTotal: 1, totalAmount: 1))
    }
    
    func test_calculate_withTwoInstallments_sendsTheCorrectResult() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [
            .init(monthlyPayment: 1, months: 1),
            .init(monthlyPayment: 2, months: 2)
        ])

        XCTAssertEqual(delegate.calculationResult, .init(totalNumber: 2, monthlyTotal: 3, totalAmount: 5))
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

