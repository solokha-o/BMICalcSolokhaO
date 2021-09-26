//
//  ResultBMIViewModel.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 25.09.2021.
//

import Foundation

class ResultBMIViewModel: ObservableObject {
    
    let indexBMI : Double
    
    let indexPI : Double
    
    let name : String
    
    let person : Person
    
    func result() -> (String, String){
        
        var title : String = ""
        var description : String = ""
        
        if person.gender == Gender.male {
            switch indexBMI {
                case 0..<20:
                    title = "underweight"
                    description = "Underweight BMI range: less than 20 kg/m2"
                case 20...25:
                    title = "normal"
                    description = "Normal BMI range: 20 kg/m2 - 25 kg/m2"
                case 25..<30:
                    title = "overweight"
                    description = "Overweight BMI range: 25 kg/m2 - 30 kg/m2"
                case 30..<100:
                    title = "obesity"
                    description = "Obesity BMI range: more than 30 kg/m2"
                default:
                    break
            }
        } else {
            switch indexBMI {
                case 0..<19:
                    title = "underweight"
                    description = "Underweight BMI range: less than 19 kg/m2"
                case 19...24:
                    title = "normal"
                    description = "Normal BMI range: 19 kg/m2 - 24 kg/m2"
                case 24..<30:
                    title = "overweight"
                    description = "Overweight BMI range: 25 kg/m2 - 30 kg/m2"
                case 30..<100:
                    title = "obesity"
                    description = "Obesity BMI range: more than 30 kg/m2"
                    
                default:
                    break
            }
        }
        
        return(title, description)
        
    }
    
    init(for person: Person) {
        
        self.person = person
        self.indexBMI = BMICalcModel.calcBMI(for: person)
        self.indexPI = BMICalcModel.calcPI(for: person)
        self.name = person.name
        
    }
    
}
