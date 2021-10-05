//
//  NavigationBarGradientModifier.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 05.10.2021.
//

import SwiftUI

struct NavigationBarGradientModifier: ViewModifier {
    
    var backgroundGradient: Gradient
    
    var startPoint: SwiftUI.UnitPoint
    
    var endPoint: SwiftUI.UnitPoint
    
    init(backgroundGradient: Gradient,startPoint: SwiftUI.UnitPoint, endPoint: SwiftUI.UnitPoint) {
        
        self.backgroundGradient = backgroundGradient
        self.startPoint = startPoint
        self.endPoint = endPoint
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .white
        
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    LinearGradient(gradient: self.backgroundGradient, startPoint: self.startPoint, endPoint: self.endPoint)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}
