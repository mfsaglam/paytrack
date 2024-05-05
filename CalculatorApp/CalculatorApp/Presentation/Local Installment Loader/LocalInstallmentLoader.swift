//
//  LocalInstallmentLoader.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import Foundation
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
    
    func delete(_ id: UUID) async throws {
        try await store.delete(id)
    }
    
    func delete(_ installments: [Installment]) async throws {
        for installment in installments {
            try await store.delete(installment.id)
        }
    }
}
