//
//  LocalInstallmentLoader.swift
//  CalculatorAppTests
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import XCTest
import InstallmentCalculator
@testable import CalculatorApp

final class LocalInstallmentLoaderTests: XCTestCase {
    
    func test_loadInstallments_notCalledOnInit() {
        let store = InstallmentStoreSpy()
        let _ = LocalInstallmentLoader(store: store)
                
        XCTAssertFalse(store.loadInstallmentsCalled)
    }
    
    func test_loadInstallments_messagesStore() async throws {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        
        let _ = try await sut.loadInstallments()
        
        XCTAssertTrue(store.loadInstallmentsCalled)
    }
    
    func test_loadInstallments_returnsCachedInstallments() async throws {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        let storedInstallments = [makeInstallment()]
        store.storedInstallments = storedInstallments
        
        let retrievedInstallments = try await sut.loadInstallments()
        
        XCTAssertEqual(store.storedInstallments, retrievedInstallments)
    }
    
    func test_save_notCalledOnInit() {
        let store = InstallmentStoreSpy()
        let _ = LocalInstallmentLoader(store: store)
                
        XCTAssertFalse(store.saveCalled)
    }
    
    func test_save_messagesStore() async throws {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        
        try await sut.save(makeInstallment())
        
        XCTAssertTrue(store.saveCalled)
    }
    
    func test_save_savesInstallment() async throws {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        let installment = makeInstallment()
        
        try await sut.save(installment)
        
        XCTAssertEqual(store.recentlySavedInstallments.first, installment)
    }
    
    func test_delete_messagesStore() async throws {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        
        try await sut.delete(makeInstallment())
        
        XCTAssertTrue(store.deleteCalled)
    }
    
    func test_delete_deletesInstallment() async throws {
        let store = InstallmentStoreSpy()
        let sut = LocalInstallmentLoader(store: store)
        let installment = makeInstallment()
        
        try await sut.delete(installment)
        
        XCTAssertEqual(store.recentlyDeletedInstallments.first, installment)
    }
    
    private class InstallmentStoreSpy: InstallmentStore {
        var loadInstallmentsCalled = false
        var saveCalled = false
        var deleteCalled = false
        var storedInstallments = [Installment]()
        var recentlySavedInstallments = [Installment]()
        var recentlyDeletedInstallments = [Installment]()

        func load() async throws -> [Installment] {
            loadInstallmentsCalled = true
            return storedInstallments
        }
        
        func save(_ installment: Installment) async throws {
            saveCalled = true
            recentlySavedInstallments.append(installment)
        }
        
        func delete(_ installment: Installment) async throws {
            deleteCalled = true
            recentlyDeletedInstallments.append(installment)
        }
    }
}
