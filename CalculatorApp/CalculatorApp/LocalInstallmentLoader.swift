//
//  LocalInstallmentLoader.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import InstallmentCalculator

class LocalInstallmentLoader: InstallmentLoader {
    private let store: InstallmentStore
    
    init(store: InstallmentStore) {
        self.store = store
    }

    func loadInstallments() async throws -> [Installment] {
        try await store.load()
    }
    
    func save(_ installment: Installment) async throws {
        try await store.save(installment)
    }
}
