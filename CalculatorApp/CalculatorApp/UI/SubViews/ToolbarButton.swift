//
//  ToolbarButton.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 18.12.2023.
//

import SwiftUI

struct ToolbarButton: View {
    var body: some View {
        Image(systemName: "plus")
            .foregroundColor(.green)
    }
}

struct ToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarButton()
    }
}
