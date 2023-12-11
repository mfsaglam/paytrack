//
//  Calculator.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 11.12.2023.
//

import Foundation

protocol CalculatorDelegate { }

class Calculator {
    let delegate: CalculatorDelegate
    
    init(delegate: CalculatorDelegate) {
        self.delegate = delegate
    }
    
    func calculate(installments: [Int]) {
        
    }
}
