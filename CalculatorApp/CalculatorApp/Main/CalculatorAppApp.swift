//
//  CalculatorAppApp.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 17.12.2023.
//

import InstallmentCalculator
import SwiftUI

@main
struct CalculatorAppApp: App {
    let viewModel: ContentViewViewModel =
        .init(
            presenter: .init(calculator: .init(),
                             installments: [])
        )
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView(
                    viewModel: viewModel
                )
            }
        }
    }
}
