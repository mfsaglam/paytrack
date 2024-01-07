//
//  Installment.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation

public struct Installment {
    public var monthlyPayment: Double
    public var months: Int
    public var startingDate: Date
    public var paymentDay: Int
    
    public var remainingMonths: Int {
        let passedMonths = Date().months(from: startingDate)
        return months - passedMonths
    }
    
    public var remainingAmount: Double {
        Double(remainingMonths) * monthlyPayment
    }

    public init(monthlyPayment: Double, months: Int, startingDate: Date, paymentDay: Int) {
        self.monthlyPayment = monthlyPayment
        self.months = months
        self.startingDate = startingDate
        self.paymentDay = paymentDay
    }
}

