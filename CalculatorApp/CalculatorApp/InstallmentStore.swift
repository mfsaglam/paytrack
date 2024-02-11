//
//  InstallmentStore.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 7.01.2024.
//

import InstallmentCalculator

protocol InstallmentStore {
    func load() async throws -> [Installment]
    func save(_ installment: Installment) async throws
    func delete(_ installment: Installment) async throws
}
