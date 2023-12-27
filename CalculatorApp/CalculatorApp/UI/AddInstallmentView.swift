//
//  AddInstallmentView.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 24.12.2023.
//

import SwiftUI

struct AddInstallmentView: View {
    var name: String
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ICTextField(title: "Name", text: name)
                ICTextField(title: "Total price", text: name)
                ICTextField(title: "Installment amount", text: name)
                ICTextField(title: "Payment date", text: name)
                Spacer()
                    .frame(height: 50)
            }
            .padding(.horizontal)
            .navigationTitle("Add Installment")
            
            VStack {
                Spacer()
                ICMainButton(buttonText: "Add", context: .positive)
                ICMainButton(buttonText: "Cancel", context: .negative)
            }
            .padding(.horizontal)
        }
    }
}

struct AddInstallmentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddInstallmentView(name: "")
        }
    }
}

struct ICTextField: View {
    var title: String
    @State var text: String

    var body: some View {
        Group {
            HStack {
                Text(title)
                    .font(.system(size: 15))
                    .foregroundColor(.gray)
                Spacer()
            }
            Rectangle()
                .foregroundColor(.gray.opacity(0.1))
                .cornerRadius(8)
                .overlay {
                    TextField("", text: $text)
                        .padding(.leading)
                }
                .frame(height: 50)
        }
    }
}

enum ButtonContext {
    case positive
    case negative
}

struct ICMainButton: View {
    var buttonText: String
    var context: ButtonContext
    var body: some View {
        Button {
            
        } label: {
            Rectangle()
                .frame(width: .infinity, height: 50)
                .foregroundColor(context == .positive ? .green : .red.opacity(0.1))
                .cornerRadius(16)
                .overlay {
                    Text(buttonText)
                        .foregroundColor(context == .positive ? .white: .red)
                }
        }
    }
}
