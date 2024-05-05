// CalculationResultsInteractor.swift

import Foundation
import InstallmentCalculator

protocol CalculationResultsInteractorProtocol {
    func loadInstallments() async throws -> [Installment]
    func save(_ installment: Installment) async throws
    func delete(_ id: UUID) async throws
}

class CalculationResultsInteractor: CalculationResultsInteractorProtocol {
    private let installmentLoader: InstallmentLoader
    
    init(installmentLoader: InstallmentLoader) {
        self.installmentLoader = installmentLoader
    }
    
    func loadInstallments() async throws -> [Installment] {
        do {
            var allInstallments = try await installmentLoader.loadInstallments()
            return try await removePassedInstallments(&allInstallments)
        } catch {
            print(error)
            return []
        }
    }
    
    func save(_ installment: Installment) async throws {
        try await installmentLoader.save(installment)
    }
    
    func delete(_ id: UUID) async throws {
        try await installmentLoader.delete(id)
    }
    
    private func removePassedInstallments(_ installments: inout [Installment]) async throws -> [Installment] {
        let passedInstallments = installments.filter { $0.remainingMonths == 0 }
        try await installmentLoader.delete(passedInstallments)
        installments.removeAll { $0.remainingMonths == 0 }
        return installments
    }
}
