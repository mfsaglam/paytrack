//
//  CalculatorAppApp.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 17.12.2023.
//

import SwiftUI

@main
struct CalculatorAppApp: App {
    let result = PresentableResult(totalAmount: "", currentlyPaying: "", remainingMonths: "")
    let installments: [PresentableInstallment] = []
    var body: some Scene {
        WindowGroup {
            ContentView(
                result: result,
                installments: installments
            )
        }
    }
}
