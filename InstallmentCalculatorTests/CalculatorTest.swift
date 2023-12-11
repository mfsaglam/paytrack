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

        sut.calculate(installments: [1])

        XCTAssertEqual(delegate.receivedResultsCount, 1)
    }
    
    func test_calculate_withOneInstallment_sendsTheCorrectResult() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [2])

        XCTAssertEqual(delegate.calculationResult, 2)
    }
    
    func test_calculate_withOneInstallment_sendsTheCorrectResult_2() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [1])

        XCTAssertEqual(delegate.calculationResult, 1)
    }
    
    private class CalculatorDelegateSpy: CalculatorDelegate {
        var receivedResultsCount: Int = 0
        var calculationResult: Int = 0
        
        func result(_ result: Int) {
            receivedResultsCount += 1
            calculationResult = result
        }
    }
}

