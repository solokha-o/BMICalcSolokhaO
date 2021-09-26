//
//  BMICalcModel.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 25.09.2021.
//

import Foundation

class BMICalcModel {
    
    
    static func calcBMI(for person: Person) -> Double {
        
        let weight = Double(person.weight)
        let height = Double(person.height)
        
        let indexBMI = weight / ((height / 100) * (height / 100))
        
        return indexBMI
    }
    
    static func calcPI(for person: Person) -> Double {
        
        let weight = Double(person.weight)
        let height = Double(person.height)
        
        let indexPI = weight / ((height / 100) * (height / 100) * (height / 100))
        
        return indexPI
        
    }
    
}


