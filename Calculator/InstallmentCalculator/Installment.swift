//
//  Installment.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation

struct Installment {
    var monthlyPayment: Double
    var months: Int
    var startingDate: Date
    var paymentDay: Int
    
    var remainingMonths: Int {
        let passedMonths = Date().months(from: startingDate)
        return months - passedMonths
    }
    
    var remainingAmount: Double {
        Double(remainingMonths) * monthlyPayment
    }

    init(monthlyPayment: Double, months: Int, startingDate: Date, paymentDay: Int) {
        self.monthlyPayment = monthlyPayment
        self.months = months
        self.startingDate = startingDate
        self.paymentDay = paymentDay
    }
}

