//
//  ContentView.swift
//  InstallmentCalculatorApp
//
//  Created by Fatih Sağlam on 16.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
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

struct InfoRectangle: View {
    let icon: String
    let description: String
    let amount: String
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(width: 140, height: 140)
            .foregroundColor(.green).opacity(0.4)
            .overlay {
                HStack {
                    VStack(alignment: .leading, spacing: 12) {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 40, height: 40)
                            .foregroundColor(.green)
                            .overlay {
                                Image(icon)
                            }
                        Text(description)
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                        Text(amount)
                            .font(.system(size: 25, weight: .bold))
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                    }
                    .padding(.leading, 12)
                    Spacer()
                }
            }
    }
}

struct InstallmentCell: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(height: 60)
            .foregroundColor(.gray).opacity(0.1)
            .padding(.horizontal, 16)
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Hair dryer")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                        HStack {
                            Text("Every 15th of the month")
                                .foregroundColor(.gray)
                                .fontWeight(.light)
                            Text("4/12")
                                .foregroundColor(.red)
                                .padding(.vertical, 2)
                                .padding(.horizontal, 4)
                                .background {
                                    RoundedRectangle(cornerRadius: 6)
                                        .fill(.pink).opacity(0.1)
                                }
                        }
                        .padding(.vertical, -10)
                        .font(.system(size: 10))
                    }
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("$817")
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        Text("$99,45")
                            .foregroundColor(.red)
                            .font(.system(size: 10))
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                    }
                }
                .padding(.horizontal)
                .padding(.horizontal)
            }
    }
}

struct ListTitle: View {
    var body: some View {
        HStack {
            Text("Details")
                .font(.body)
                .bold()
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.top, 16)
        .padding(.leading, 16)
    }
}

struct FloatingButton: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button {
                    
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 44, height: 44)
                        .foregroundColor(.green)
                        .overlay {
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                        }
                        .padding(32)
                }
            }
        }
    }
}

struct ToolbarButton: View {
    var body: some View {
        Button {
            
        } label: {
            Image(systemName: "plus")
                .foregroundColor(.green)
        }
    }
}
