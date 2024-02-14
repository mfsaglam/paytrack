//
//  ContentViewViewModel.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 15.02.2024.
//

import SwiftUI

final class ContentViewViewModel: ObservableObject {
    let presenter: CalculationResultsPresenter?
    
    @Published var result: PresentableResult?
    @Published var installments: [PresentableInstallment]
    var isEmpty: Bool {
        installments.isEmpty
    }
    
    
    init(presenter: CalculationResultsPresenter) {
        self.presenter = presenter
        
        self.result = presenter.presentableResult
        self.installments = presenter.presentableInstallments
    }
    
    private init(result: PresentableResult, installments: [PresentableInstallment]) {
        self.presenter = nil
        self.result = result
        self.installments = installments
    }
}

extension ContentViewViewModel {
    static func forPreview() -> ContentViewViewModel {
        .init(
            result: .init(totalAmount: "123", currentlyPaying: "12", remainingMonths: "12"),
            installments: [
                .init(id: .init(), name: "iPhone", paymentDay: 2, paidMonths: 2, totalMonths: 12, remainingAmount: 500, monthlyPayment: 59.90)
            ]
        )
    }
}