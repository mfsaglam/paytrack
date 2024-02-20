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

    var isValidForm: Bool {
        guard !name.isEmpty && !totalPrice.isEmpty && !monthlyPayment.isEmpty && !paymentDate.isEmpty else {
            return false
        }
        
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        print("saved")
    }
}
