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
        let _ = LocalInstallmentLoader(store: store)
                
        XCTAssertFalse(store.loadInstallmentsCalled)
    }
    
    func test_loadInstallments_messagesStore() {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        
        let _ = sut.loadInstallments()
        
        XCTAssertTrue(store.loadInstallmentsCalled)
    }
    
    func test_loadInstallments_returnsCachedInstallments() {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        let storedInstallments = [makeInstallment()]
        store.storedInstallments = storedInstallments
        
        let retrievedInstallments = sut.loadInstallments()
        
        XCTAssertEqual(store.storedInstallments, retrievedInstallments)
    }
    
    private class InstallmentStoreSpy: InstallmentStore {
        var loadInstallmentsCalled = false
        var storedInstallments = [Installment]()
        func loadInstallments() -> [Installment] {
            loadInstallmentsCalled = true
            return storedInstallments
        }
    }
}