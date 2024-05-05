//
//  InstallmentFilterer.swift
//  InstallmentCalculator
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import Foundation

struct InstallmentFilterer {
    func filterPastInstallments(_ installments: [Installment]) -> [Installment] {
        return installments.filter { installment in
            return installment.remainingMonths > 0
        }
    }
}
