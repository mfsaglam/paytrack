//
//  InstallmentLoader.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import InstallmentCalculator

protocol InstallmentLoader {
    func loadInstallments() -> [Installment]
}