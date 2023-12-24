//
//  ListTitle.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 18.12.2023.
//

import SwiftUI

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

struct ListTitle_Previews: PreviewProvider {
    static var previews: some View {
        ListTitle()
    }
}
