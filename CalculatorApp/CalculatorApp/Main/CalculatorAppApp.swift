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
    var viewModel: ContentViewViewModel =
        .init(
            presenter: .init(
                calculator: Calculator(),
                interactor: CalculationResultsInteractor(
                    installmentLoader: LocalInstallmentLoader(
                        store: CoreDataInstallmentStore()
                    )
                )
            )
        )
    var body: some Scene {
        WindowGroup {
            ContentView(
                viewModel: viewModel
            )
        }
    }
}
