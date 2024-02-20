//
//  InstallmentCell.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 18.12.2023.
//

import InstallmentCalculator
import SwiftUI

struct InstallmentCell: View {
    @State var installment: PresentableInstallment
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .frame(height: 60)
            .foregroundColor(.gray).opacity(0.1)
            .padding(.horizontal, 16)
            .overlay {
                HStack {
                    VStack(alignment: .leading) {
                        Text(installment.name)
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                        HStack {
                            Text("Every \(installment.paymentDay)th of the month")
                                .foregroundColor(.gray)
                                .fontWeight(.light)
                            Text("\(installment.paidMonths)/\(installment.totalMonths)")
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
                        Text("$\(installment.remainingAmount)")
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        Text("$\(installment.monthlyPayment)")
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

struct InstallmentCell_Previews: PreviewProvider {
    static var previews: some View {
        InstallmentCell(installment: .init(id: UUID(), name: "iPhone", paymentDay: 5, paidMonths: 1, totalMonths: 12, remainingAmount: 1450, monthlyPayment: 50))
    }
}
