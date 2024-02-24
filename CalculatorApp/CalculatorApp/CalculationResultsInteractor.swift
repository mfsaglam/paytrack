// CalculationResultsInteractor.swift

import Foundation
import InstallmentCalculator

protocol CalculationResultsInteractorProtocol {
    func loadInstallments() async throws -> [Installment]
    func save(_ installment: Installment) async throws
    func delete(_ installment: Installment) async throws
}

class CalculationResultsInteractor: CalculationResultsInteractorProtocol {
    private let installmentLoader: InstallmentLoader
    private var installments = [Installment]()

    init(installmentLoader: InstallmentLoader) {
        self.installmentLoader = installmentLoader
    }

    func loadInstallments() async throws -> [Installment] {
        do {
            return try await installmentLoader.loadInstallments()
        } catch {
            print(error)
            return []
        }
    }
    
    func save(_ installment: Installment) async throws {
        try await installmentLoader.save(installment)
    }
    
    func delete(_ installment: Installment) async throws {
        try await installmentLoader.delete(installment)
    }
}
