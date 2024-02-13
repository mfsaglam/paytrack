//
//  ContentView.swift
//  InstallmentCalculatorApp
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State var result: PresentableResult
    @State var installments: [PresentableInstallment]
    @State var isEmpty: Bool = false
    var body: some View {
        ZStack {
            if isEmpty {
                EmptyListView()
            } else {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            InfoRectangle(icon: "receipt-item", description: "Total amount", amount: result.totalAmount)
                            InfoRectangle(icon: "money-send", description: "Currently paying", amount: result.currentlyPaying)
                            InfoRectangle(icon: "coin", description: "Remaining months", amount: result.remainingMonths)
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    ListTitle()
                    
                    ScrollView {
                        ForEach(installments) { installment in
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
            ContentView(
                result: .init(totalAmount: "$1432,45", currentlyPaying: "$340,4", remainingMonths: "35"),
                installments: []
            )
        }
    }
}
