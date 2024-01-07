//
//  LocalInstallmentLoader.swift
//  CalculatorAppTests
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import XCTest
@testable import InstallmentCalculator

protocol InstallmentLoader {
    func loadInstallments() -> [Installment]
}

protocol InstallmentStore {
    func loadInstallments() -> [Installment]
}

class LocalInstallmentLoader: InstallmentLoader {
    private let store: InstallmentStore
    
    init(store: InstallmentStore) {
        self.store = store
    }

    func loadInstallments() -> [Installment] {
        store.loadInstallments()
    }
}

final class LocalInstallmentLoaderTests: XCTestCase {
    
    func test_() {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        
        let _ = sut.loadInstallments()
        
        XCTAssertTrue(store.loadInstallmentsCalled)
    }
    
    private class InstallmentStoreSpy: InstallmentStore {
        var loadInstallmentsCalled = false
        func loadInstallments() -> [Installment] {
            loadInstallmentsCalled = true
            return []
        }
    }
}
