//
//  LocalInstallmentLoader.swift
//  CalculatorAppTests
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import XCTest
@testable import CalculatorApp
@testable import InstallmentCalculator

final class LocalInstallmentLoaderTests: XCTestCase {
    
    func test_loadInstallments_notCalledOnInit() {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
                
        XCTAssertFalse(store.loadInstallmentsCalled)
    }
    
    func test_loadInstallments_messagesStore() {
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
