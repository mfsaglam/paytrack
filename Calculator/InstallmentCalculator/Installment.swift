//
//  Installment.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import Foundation

public struct Installment: Identifiable {
    public var id: UUID
    public var name: String
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

    public init(id: UUID, name: String, monthlyPayment: Double, months: Int, startingDate: Date, paymentDay: Int) {
        self.id = id
        self.name = name
        self.monthlyPayment = monthlyPayment
        self.months = months
        self.startingDate = startingDate
        self.paymentDay = paymentDay
    }
}

