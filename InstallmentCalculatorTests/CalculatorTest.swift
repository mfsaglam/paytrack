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
    func test_calculate_withNoInstallments_doesNotCalculate() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)
        
        sut.calculate(installments: [])
        
        XCTAssertEqual(delegate.calculatedInstallmentsCount, 0)
    }
    
    func test_calculate_withOneInstallment_calculates() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [1])

        XCTAssertEqual(delegate.calculatedInstallmentsCount, 1)
    }
    
    func test_calculate_withOneInstallment_sendsTheResult() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [2])

        XCTAssertEqual(delegate.calculationResult, 2)
    }
    
    func test_calculate_withOneInstallment_sendsTheResult_2() {
        let delegate = CalculatorDelegateSpy()
        let sut = Calculator(delegate: delegate)

        sut.calculate(installments: [1])

        XCTAssertEqual(delegate.calculationResult, 1)
    }
    
    private class CalculatorDelegateSpy: CalculatorDelegate {
        var calculatedInstallmentsCount: Int = 0
        var calculationResult: Int = 0
        
        func result(_ result: Int) {
            calculatedInstallmentsCount += 1
            calculationResult = result
        }
    }
}

