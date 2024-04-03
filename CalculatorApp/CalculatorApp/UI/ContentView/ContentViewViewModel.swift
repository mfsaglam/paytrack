//
//  ContentViewViewModel.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 15.02.2024.
//

import InstallmentCalculator
import SwiftUI

final class ContentViewViewModel: ObservableObject {
    let presenter: CalculationResultsPresenter?
    
    @Published var result: PresentableResult? = nil
    @Published var installments: [PresentableInstallment] = []
    var isEmpty: Bool {
        installments.isEmpty
    }
    
    init(presenter: CalculationResultsPresenter) {
        self.presenter = presenter
    }
    
    func presentResults() {
        Task { @MainActor in
            if let (result, installments) = try await presenter?.presentResults() {
                self.result = result
                self.installments = installments
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        let source = offsets.first!
        let installmentToDelete = installments[source]
        Task { @MainActor in
            try await presenter?.interactor.delete(installmentToDelete.id)
        }
        presentResults()
    }
    
    private init(result: PresentableResult, installments: [PresentableInstallment]) {
        self.presenter = nil
        self.result = result
        self.installments = installments
    }
}

extension ContentViewViewModel {
    static func forPreview(
        isEmpty: Bool = false
    ) -> ContentViewViewModel {
        .init(
            result: .init(totalAmount: "123", currentlyPaying: "12", remainingMonths: "12"),
            installments: isEmpty ? [] : [
                .init(id: .init(), name: "iPhone", paymentDay: "2", paidMonths: "2", totalMonths: "12", remainingAmount: "500", monthlyPayment: "59.90"),
                .init(id: .init(), name: "iPhone", paymentDay: "2", paidMonths: "2", totalMonths: "12", remainingAmount: "500", monthlyPayment: "59.90"),
                .init(id: .init(), name: "iPhone", paymentDay: "2", paidMonths: "2", totalMonths: "12", remainingAmount: "500", monthlyPayment: "59.90"),
            ]
        )
    }
}
