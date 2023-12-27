//
//  ContentView.swift
//  InstallmentCalculatorApp
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State var isEmpty: Bool = false
    var body: some View {
        ZStack {
            if isEmpty {
                EmptyListView()
            } else {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            InfoRectangle(icon: "receipt-item", description: "Total amount", amount: "$1432,45")
                            InfoRectangle(icon: "money-send", description: "Currently paying", amount: "$340,4")
                            InfoRectangle(icon: "coin", description: "Remaining months", amount: "35")
                        }
                        .padding(.horizontal, 16)
                    }
                    
                    ListTitle()
                    
                    ScrollView {
                        InstallmentCell()
                        InstallmentCell()
                        InstallmentCell()
                        InstallmentCell()
                        InstallmentCell()
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
            ContentView()
        }
    }
}
