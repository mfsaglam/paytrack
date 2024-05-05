//
//  InfoRectangle.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 18.12.2023.
//

import SwiftUI

struct InfoRectangle: View {
    let icon: String
    let description: String
    let amount: String
    let isMain: Bool
    
    init(icon: String, description: String, amount: String, isMain: Bool = false) {
        self.icon = icon
        self.description = description
        self.amount = amount
        self.isMain = isMain
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .frame(width: 140, height: 140)
            .foregroundColor(.green).opacity( isMain ? 0.4 : 0.1)
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

struct InfoRectangle_Previews: PreviewProvider {
    static var previews: some View {
        InfoRectangle(icon: "coin", description: "Description", amount: "$123")
    }
}
