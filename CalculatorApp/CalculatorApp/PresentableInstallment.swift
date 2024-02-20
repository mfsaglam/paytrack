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
    var paymentDay: Int
    var paidMonths: Int
    var totalMonths: Int
    var remainingAmount: Double
    var monthlyPayment: Double
}

extension Installment {
    var presentable: PresentableInstallment {
        .init(
            id: self.id,
            name: self.name,
            paymentDay: self.paymentDay,
            paidMonths: self.months - self.remainingMonths,
            totalMonths: self.months,
            remainingAmount: self.remainingAmount,
            monthlyPayment: self.monthlyPayment
        )
    }
}
