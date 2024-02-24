//
//  ContentView.swift
//  InstallmentCalculatorApp
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel: ContentViewViewModel
    
    var body: some View {
        NavigationView {
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
                
                NavigationLink(destination: AddInstallmentView()) {
                    FloatingButton()
                }
            }
            .navigationTitle("My Installments")
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: AddInstallmentView()) {
                        ToolbarButton()
                    }
                }
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
