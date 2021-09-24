//
//  MainViewModel.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 24.09.2021.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    let imageName : String
    
    init(imageName : String = "BMIimage") {
        self.imageName = imageName
    }
}
