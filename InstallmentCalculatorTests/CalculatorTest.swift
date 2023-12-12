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
    
    func test_calculate_withOneUpcomingInstallment_sendsTheResult() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment()
        ])

        XCTAssertEqual(delegate.receivedResultsCount, 1)
    }
    
    func test_calculate_withOneUpcomingInstallment_sendsTheCorrectResult() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment()
        ])
        
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOneUpcomingInstallment_sendsTheCorrectResult_2() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment()
        ])
        
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withTwoUpcomingInstallments_sendsTheCorrectResult() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment(),
            makeInstallment(months: 2, monthlyPayment: 2)
        ])
        
        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 3, totalAmount: 5)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOnePastInstallment_shouldNotCalculatePastInstallment() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment(months: 2, monthlyPayment: 1, date: .threeMonthsAgo)
        ])

        let expectedResult = CalculationResult(totalNumber: 0, monthlyTotal: 0, totalAmount: 0)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOnePastAndOneUpcomingInstallment_shouldNotCalculatePastInstallment() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment(months: 2, monthlyPayment: 1, date: .threeMonthsAgo),
            makeInstallment()
        ])

        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOnePastAndTwoUpcomingInstallments_shouldNotCalculatePastInstallment() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment(months: 2, monthlyPayment: 1, date: .threeMonthsAgo),
            makeInstallment(),
            makeInstallment()
        ])

        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 2, totalAmount: 2)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(delegate: CalculatorDelegate) -> Calculator {
        Calculator(delegate: delegate)
    }
    
    private func makeInstallment(
        months: Int = 1,
        monthlyPayment: Double = 1,
        date: InstallmentTestDate = .tomorrow
    ) -> Installment {
        var installment = Installment()
        installment.months = months
        installment.monthlyPayment = monthlyPayment
        installment.dateAdded = Date(timeIntervalSinceNow: date.rawValue)
        
        return installment
    }

    private class CalculatorDelegateSpy: CalculatorDelegate {
        var receivedResultsCount: Int = 0
        var calculationResult: CalculationResult? = nil
        
        func result(_ result: InstallmentCalculator.CalculationResult) {
            receivedResultsCount += 1
            calculationResult = result
        }
    }
    
    private enum InstallmentTestDate: TimeInterval {
        case tomorrow = 86400 // 24 hours
        case threeMonthsAgo = -7776000 // -90 days
    }
}

extension CalculationResult: Equatable {
    public static func == (lhs: CalculationResult, rhs: CalculationResult) -> Bool {
        return lhs.monthlyTotal == rhs.monthlyTotal &&
        lhs.totalAmount == rhs.totalAmount &&
        lhs.totalNumber == rhs.totalNumber
    }
}

