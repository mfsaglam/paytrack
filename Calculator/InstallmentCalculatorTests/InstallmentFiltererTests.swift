//
//  InstallmentFiltererTests.swift
//  InstallmentCalculatorTests
//
//  Created by Fatih Sağlam on 6.01.2024.
//

import Foundation
import XCTest
@testable import InstallmentCalculator

final class InstallmentFiltererTests: XCTestCase {
    
    func test_filterPastInstallments_emptyInstallments_returnsEmpty() {
        let sut = InstallmentFilterer()
        let expectedResult: [Installment] = []
        
        let filteredResult = sut.filterPastInstallments(
            []
        )
        
        XCTAssertEqual(filteredResult, expectedResult)
    }
    
    func test_filterPastInstallments_oneUpcomingInstallment_doesNotFilter() {
        let sut = InstallmentFilterer()
        let upcomingInstallment = makeInstallment()
        let expectedResult: [Installment] = [upcomingInstallment]
        
        let filteredResult = sut.filterPastInstallments(
            [upcomingInstallment]
        )
        
        XCTAssertEqual(filteredResult, expectedResult)
    }
    
    func test_filterPastInstallments_onePassedInstallment_filtersPassed() {
        let sut = InstallmentFilterer()
        let expectedResult: [Installment] = []
        
        let filteredResult = sut.filterPastInstallments(
            [
                makeInstallment(startingDate: .threeMonthsAgo)
            ]
        )
        
        XCTAssertEqual(filteredResult, expectedResult)
    }
    
    func test_filterPastInstallments_onePassedOneUpcomingInstallment_filtersPassed() {
        let sut = InstallmentFilterer()
        let upcomingInstallment = makeInstallment()
        let expectedResult: [Installment] = [upcomingInstallment]
        
        let filteredResult = sut.filterPastInstallments(
            [
                makeInstallment(startingDate: .threeMonthsAgo),
                upcomingInstallment
            ]
        )
        
        XCTAssertEqual(filteredResult, expectedResult)
    }
    
    func test_filterPastInstallments_twoPassedInstallments_returnsEmpty() {
        let sut = InstallmentFilterer()
        let passedInstallments = [
            makeInstallment(startingDate: .threeMonthsAgo),
            makeInstallment(startingDate: .threeMonthsAgo)
        ]
        let expectedResult: [Installment] = []
        
        let filteredResult = sut.filterPastInstallments(passedInstallments)
        
        XCTAssertEqual(filteredResult, expectedResult)
    }

}
