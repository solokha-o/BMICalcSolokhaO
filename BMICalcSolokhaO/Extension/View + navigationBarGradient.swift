//
//  View + navigationBarGradient.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 05.10.2021.
//

import SwiftUI

extension View {
 
    func navigationBarGradient(_ gradient: Gradient, startPoint: SwiftUI.UnitPoint, endPoint: SwiftUI.UnitPoint) -> some View {
        self.modifier(NavigationBarGradientModifier(backgroundGradient: gradient, startPoint: startPoint, endPoint: endPoint))
    }

}
