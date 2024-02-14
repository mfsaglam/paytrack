//
//  ContentView.swift
//  InstallmentCalculatorApp
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import SwiftUI

final class ContentViewViewModel: ObservableObject {
    let presenter: CalculationResultsPresenter?
    
    @Published var result: PresentableResult?
    @Published var installments: [PresentableInstallment]
    var isEmpty: Bool {
        installments.isEmpty
    }
    
    
    init(presenter: CalculationResultsPresenter) {
        self.presenter = presenter
        
        self.result = presenter.presentableResult
        self.installments = presenter.presentableInstallments
    }
    
    private init(result: PresentableResult, installments: [PresentableInstallment]) {
        self.presenter = nil
        self.result = result
        self.installments = installments
    }
}

extension ContentViewViewModel {
    static func forPreview() -> ContentViewViewModel {
        .init(
            result: .init(totalAmount: "123", currentlyPaying: "12", remainingMonths: "12"),
            installments: [
                .init(id: .init(), name: "iPhone", paymentDay: 2, paidMonths: 2, totalMonths: 12, remainingAmount: 500, monthlyPayment: 59.90)
            ]
        )
    }
}

struct ContentView: View {
    @StateObject var viewModel: ContentViewViewModel
    
    var body: some View {
        ZStack {
            if viewModel.isEmpty {
                EmptyListView()
            } else {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            if let result = viewModel.result {
                                InfoRectangle(icon: "receipt-item", description: "Total amount", amount: result.totalAmount)
                                InfoRectangle(icon: "money-send", description: "Currently paying", amount: result.currentlyPaying)
                                InfoRectangle(icon: "coin", description: "Remaining months", amount: result.remainingMonths)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    ListTitle()
                    
                    ScrollView {
                        ForEach(viewModel.installments) { installment in
                            InstallmentCell(installment: installment)
                        }
                    }
                }
            }

            FloatingButton()
        }
        .navigationTitle("My Installments")
        .toolbar {
            ToolbarItem {
                ToolbarButton()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(viewModel: .forPreview())
        }
    }
}
