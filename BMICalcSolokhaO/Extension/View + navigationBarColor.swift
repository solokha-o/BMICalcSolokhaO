//
//  View + navigationBarColor.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 26.09.2021.
//

import SwiftUI

extension View {
 
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }

}
