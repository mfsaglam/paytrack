//
//  InstallmentTests.swift
//  InstallmentCalculatorTests
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import XCTest
@testable import InstallmentCalculator

final class InstallmentTests: XCTestCase {

    func test_remainingMonths_withUpcomingInstallment_calculatedCorrectly() {
        let sut = makeSUT(
            months: 6,
            startingDate: .tomorrow
        )
        
        XCTAssertEqual(sut.remainingMonths, 6)
    }
    
    func test_remainingMonths_withPastInstallment_calculatedCorrectly() {
        let sut = makeSUT(
            months: 6,
            startingDate: .threeMonthsAgo
        )
        
        XCTAssertEqual(sut.remainingMonths, 3)
    }
    
    func test_remainingMonths_withPastInstallment_calculatedCorrectly_2() {
        let sut = makeSUT(
            months: 12,
            startingDate: .threeMonthsAgo
        )
        
        XCTAssertEqual(sut.remainingMonths, 9)
    }
    
    func test_remainingAmount_withPastInstallment_calculatedCorrectly() {
        let sut = makeSUT(
            months: 12,
            monthlyPayment: 2,
            startingDate: .threeMonthsAgo
        )
        
        XCTAssertEqual(sut.remainingAmount, 18)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(
        months: Int = 1,
        monthlyPayment: Double = 1,
        startingDate: InstallmentTestDate = .tomorrow,
        paymentDay: Int = 1
    ) -> Installment {
        makeInstallment(
            months: months,
            monthlyPayment: monthlyPayment,
            startingDate: startingDate,
            paymentDay: paymentDay
        )
    }
}
