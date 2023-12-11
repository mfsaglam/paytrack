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
    
    private class CalculatorDelegateSpy: CalculatorDelegate {
        var calculatedInstallmentsCount: Int = 0
    }
}

