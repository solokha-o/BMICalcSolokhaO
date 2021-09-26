//
//  View + hideKeyboard.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 26.09.2021.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
