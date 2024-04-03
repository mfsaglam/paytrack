//
//  String+Extension.swift
//  CalculatorApp
//
//  Created by Fatih Sağlam on 3.04.2024.
//

import Foundation

extension String {
    var isConvertibleToDouble: Bool {
        return Double(self) != nil
    }

    func isZeroAfterDoubleConversion() -> Bool {
        if let doubleValue = Double(self) {
            return doubleValue == 0.0
        } else {
            return false
        }
    }

    var isConvertibleToInt: Bool {
        return Int(self) != nil
    }
}
