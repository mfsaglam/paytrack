//
//  AddInstallmentViewViewModel.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 20.02.2024.
//

import SwiftUI
import InstallmentCalculator

class AddInstallmentViewViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var totalPrice: String = ""
    @Published var monthlyPayment: String = ""
    @Published var paymentDate: String = ""
    
    let interactor: CalculationResultsInteractorProtocol?
    
    init(interactor: CalculationResultsInteractorProtocol?) {
        self.interactor = interactor
    }

    var isValidForm: Bool {
        guard !name.isEmpty && 
                !totalPrice.isEmpty && totalPrice.isConvertibleToDouble &&
                !monthlyPayment.isEmpty && monthlyPayment.isConvertibleToDouble &&
                !paymentDate.isEmpty && paymentDate.isConvertibleToInt
        else {
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        let installment = Installment(
            id: UUID(), name: name,
            monthlyPayment: Double(monthlyPayment)!,
            months: Int(Double(totalPrice)! / Double(monthlyPayment)!),
            startingDate: Date(),
            paymentDay: Int(paymentDate)!
        )

        Task { @MainActor in
            try await interactor?.save(installment)
        }
    }
}

extension String {
    var isConvertibleToDouble: Bool {
        return Double(self) != nil
    }
}

extension String {
    var isConvertibleToInt: Bool {
        return Int(self) != nil
    }
}
