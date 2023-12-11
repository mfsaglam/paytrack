//
//  Calculator.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 11.12.2023.
//

import Foundation

protocol CalculatorDelegate {
    func result(_ result: Int)
}

class Calculator {
    let delegate: CalculatorDelegate
    
    init(delegate: CalculatorDelegate) {
        self.delegate = delegate
    }
    
    func calculate(installments: [Int]) {
        if !installments.isEmpty {
            delegate.result(installments.first!)
        }
    }
}
