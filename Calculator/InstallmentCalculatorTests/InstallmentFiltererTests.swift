//
//  InstallmentFiltererTests.swift
//  InstallmentCalculatorTests
//
//  Created by Fatih Sağlam on 6.01.2024.
//

import Foundation
import XCTest
@testable import InstallmentCalculator

class InstallmentFilterer {
    func filterPastInstallments(_ installments: [Installment]) -> [Installment] {
        return []
    }
}

final class InstallmentFiltererTests: XCTestCase {
    
    func test_() {
        let sut = InstallmentFilterer()
        let expectedResult: [Installment] = []
        
        let filteredResult = sut.filterPastInstallments(
            []
        )
        
        XCTAssertEqual(filteredResult, expectedResult)
    }
}

extension Installment: Identifiable {
    public var id: UUID {
        UUID()
    }
}

extension Installment: Equatable {
    public static func == (lhs: Installment, rhs: Installment) -> Bool {
        rhs.id == lhs.id
    }
}
