//
//  PresentableInstallment.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 14.02.2024.
//

import InstallmentCalculator
import Foundation

struct PresentableInstallment: Identifiable {
    var id: UUID
    var name: String
    var paymentDay: String
    var paidMonths: String
    var totalMonths: String
    var remainingAmount: String
    var monthlyPayment: String
}
