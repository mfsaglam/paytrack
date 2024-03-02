//
//  FloatingButton.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 18.12.2023.
//

import SwiftUI

struct FloatingButton<T: View>: View {
    let destination: T
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                NavigationLink(destination: destination) {
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

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(destination: Text("Preview"))
    }
}
