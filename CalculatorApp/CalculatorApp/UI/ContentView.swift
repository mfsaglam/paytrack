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
                VStack {
                    Spacer()
                        .frame(height: 90)
                    Image("emptyListIllustration")
                        .padding(.bottom, 35)
                    Text("You’ve no installments added for now. \nAdd all, and manage your expenses.")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    Spacer()
                    HStack {
                        Spacer()
                        Image("arrow")
                            .padding(.bottom, 45)
                            .padding(.trailing, 89)
                    }
                }
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
            ContentView(isEmpty: true)
        }
    }
}
