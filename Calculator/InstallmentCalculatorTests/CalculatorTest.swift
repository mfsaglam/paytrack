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
        
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1, totalRemainingMonths: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOneUpcomingInstallment_sendsTheCorrectResult_2() {
        let sut = makeSUT(delegate: delegate)

        sut.calculate(installments: [
            makeInstallment()
        ])
        
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1, totalRemainingMonths: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withTwoUpcomingInstallments_sendsTheCorrectResult() {
        let sut = makeSUT(delegate: delegate)
        let installments = [
            makeInstallment(),
            makeInstallment(months: 2, monthlyPayment: 2)
        ]

        sut.calculate(installments: installments)
        
        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 3, totalAmount: 5, totalRemainingMonths: 2)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOnePastInstallment_shouldNotCalculatePastInstallment() {
        let sut = makeSUT(delegate: delegate)
        let installments = [
            makeInstallment(months: 2, monthlyPayment: 1, startingDate: .threeMonthsAgo)
        ]

        sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 0, monthlyTotal: 0, totalAmount: 0, totalRemainingMonths: 0)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOnePastAndOneUpcomingInstallment_shouldNotCalculatePastInstallment() {
        let sut = makeSUT(delegate: delegate)
        let installments = [
            makeInstallment(months: 2, monthlyPayment: 1, startingDate: .threeMonthsAgo),
            makeInstallment()
        ]

        sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1, totalRemainingMonths: 1)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOnePastAndTwoUpcomingInstallments_shouldNotCalculatePastInstallment() {
        let sut = makeSUT(delegate: delegate)
        let installments = [
            makeInstallment(months: 2, monthlyPayment: 1, startingDate: .threeMonthsAgo),
            makeInstallment(),
            makeInstallment()
        ]

        sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 2, totalAmount: 2, totalRemainingMonths: 2)

        XCTAssertEqual(delegate.calculationResult, expectedResult)
    }
    
    func test_calculate_withOnePastAndOneUpcomingInstallments_shouldCalculateRemainingAmountCorrectly() {
        let sut = makeSUT(delegate: delegate)
        let installments = [
            makeInstallment(months: 4, monthlyPayment: 1, startingDate: .threeMonthsAgo),
            makeInstallment(),
        ]

        sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 2, totalAmount: 2, totalRemainingMonths: 1)

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
        lhs.totalNumber == rhs.totalNumber &&
        lhs.totalRemainingMonths == rhs.totalRemainingMonths
    }
}

