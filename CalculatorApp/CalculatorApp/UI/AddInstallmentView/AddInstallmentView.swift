//
//  AddInstallmentView.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 24.12.2023.
//

import SwiftUI

struct AddInstallmentView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: AddInstallmentViewViewModel
    @State private var showingAlert = false
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                ICTextField(title: "Name", keyboardType: .default, text: $viewModel.name)
                ICTextField(title: "Total price", keyboardType: .decimalPad, text: $viewModel.totalPrice)
                ICTextField(title: "Monthly payment", keyboardType: .decimalPad, text: $viewModel.monthlyPayment)
                ICTextField(title: "Payment date", keyboardType: .numberPad, text: $viewModel.paymentDate)
                Spacer()
                    .frame(height: 50)
            }
            .padding(.horizontal)
            .navigationTitle("Add Installment")
            
            VStack {
                Spacer()
                ICMainButton(buttonText: "Add", context: .positive) {
                    if viewModel.isValidForm {
                        viewModel.saveChanges()
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        showingAlert = true
                    }
                }
                ICMainButton(buttonText: "Cancel", context: .negative) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .padding(.horizontal)
            .alert("Please check all the necessary fields are filled.", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            }
        }
    }
}

struct AddInstallmentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddInstallmentView(viewModel: .forPreview())
        }
    }
}

extension AddInstallmentViewViewModel {
    static func forPreview() -> AddInstallmentViewViewModel {
        .init(
            interactor: nil
        )
    }
}
struct ICTextField: View {
    var title: String
    var keyboardType: UIKeyboardType = .default
    @Binding var text: String

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
                        .keyboardType(keyboardType)
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
    var action: (() -> Void)? = nil
    var body: some View {
        Button {
            action?()
        } label: {
            Rectangle()
                .frame(height: 50)
                .foregroundColor(context == .positive ? .green : .red.opacity(0.1))
                .cornerRadius(16)
                .overlay {
                    Text(buttonText)
                        .foregroundColor(context == .positive ? .white: .red)
                }
        }
    }
}
