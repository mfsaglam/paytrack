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
        let sut = makeSUT()
        let expectedResult = CalculationResult(totalNumber: 0, monthlyTotal: 0, totalAmount: 0, totalRemainingMonths: 0)
        
        let result = sut.calculate(installments: [])
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculate_withOneUpcomingInstallment_sendsTheCorrectResult() {
        let sut = makeSUT()

        let result = sut.calculate(installments: [
            makeInstallment()
        ])
        
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1, totalRemainingMonths: 1)

        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculate_withOneUpcomingInstallment_sendsTheCorrectResult_2() {
        let sut = makeSUT()
        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1, totalRemainingMonths: 1)

        let result = sut.calculate(installments: [
            makeInstallment()
        ])

        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculate_withTwoUpcomingInstallments_sendsTheCorrectResult() {
        let sut = makeSUT()
        let installments = [
            makeInstallment(),
            makeInstallment(months: 2, monthlyPayment: 2)
        ]

        let result = sut.calculate(installments: installments)
        
        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 3, totalAmount: 5, totalRemainingMonths: 2)

        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculate_withOnePastInstallment_shouldNotCalculatePastInstallment() {
        let sut = makeSUT()
        let installments = [
            makeInstallment(months: 2, monthlyPayment: 1, startingDate: .threeMonthsAgo)
        ]

        let result = sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 0, monthlyTotal: 0, totalAmount: 0, totalRemainingMonths: 0)

        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculate_withOnePastAndOneUpcomingInstallment_shouldNotCalculatePastInstallment() {
        let sut = makeSUT()
        let installments = [
            makeInstallment(months: 2, monthlyPayment: 1, startingDate: .threeMonthsAgo),
            makeInstallment()
        ]

        let result = sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 1, monthlyTotal: 1, totalAmount: 1, totalRemainingMonths: 1)

        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculate_withOnePastAndTwoUpcomingInstallments_shouldNotCalculatePastInstallment() {
        let sut = makeSUT()
        let installments = [
            makeInstallment(months: 2, monthlyPayment: 1, startingDate: .threeMonthsAgo),
            makeInstallment(),
            makeInstallment()
        ]

        let result = sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 2, totalAmount: 2, totalRemainingMonths: 1)

        XCTAssertEqual(result, expectedResult)
    }
    
    func test_calculate_withOnePastAndOneUpcomingInstallments_shouldCalculateRemainingAmountCorrectly() {
        let sut = makeSUT()
        let installments = [
            makeInstallment(months: 4, monthlyPayment: 1, startingDate: .threeMonthsAgo),
            makeInstallment(),
        ]

        let result = sut.calculate(installments: installments)

        let expectedResult = CalculationResult(totalNumber: 2, monthlyTotal: 2, totalAmount: 2, totalRemainingMonths: 1)

        XCTAssertEqual(result, expectedResult)
    }

    // MARK: - Helpers
    
    private func makeSUT() -> Calculator {
        Calculator()
    }
}

