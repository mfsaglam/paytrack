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
    
    // MARK: - Helpers
    
    private func makeSUT(
        months: Int = 1,
        monthlyPayment: Double = 1,
        startingDate: InstallmentTestDate = .tomorrow
    ) -> Installment {
        let installment = Installment(
            monthlyPayment: monthlyPayment,
            months: months,
            startingDate: startingDate.date
        )
        
        return installment
    }
}
