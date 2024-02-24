// CalculationResultsInteractor.swift

import Foundation
import InstallmentCalculator

protocol CalculationResultsInteractorProtocol {
    func loadInstallments(completion: @escaping ([Installment]) -> Void)
}

class CalculationResultsInteractor: CalculationResultsInteractorProtocol {
    private let installmentLoader: InstallmentLoader

    init(installmentLoader: InstallmentLoader) {
        self.installmentLoader = installmentLoader
    }

    func loadInstallments(completion: @escaping ([Installment]) -> Void) {
        Task { @MainActor in
            do {
                let installments = try await installmentLoader.loadInstallments()
                completion(installments)
            } catch {
                // Handle error (e.g., show an alert)
                completion([])
            }
        }
    }
}
