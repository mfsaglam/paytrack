//
//  EmptyListView.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 27.12.2023.
//

import SwiftUI

struct EmptyListView: View {
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 90)
            image
            text
            Spacer()
            arrow
        }
    }

    private var image: some View {
        Image("emptyListIllustration")
            .padding(.bottom, 35)
    }
    
    private var text: some View {
        Text("You’ve no installments added for now. \nAdd all, and manage your expenses.")
            .font(.system(size: 18, weight: .bold))
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
    }
    
    private var arrow: some View {
        HStack {
            Spacer()
            Image("arrow")
                .padding(.bottom, 45)
                .padding(.trailing, 89)
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
