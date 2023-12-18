//
//  InstallmentCell.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 18.12.2023.
//

import SwiftUI

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

struct InstallmentCell_Previews: PreviewProvider {
    static var previews: some View {
        InstallmentCell()
    }
}
