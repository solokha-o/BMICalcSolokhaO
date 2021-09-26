//
//  Person.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 25.09.2021.
//

import Foundation

struct Person {
    
    let name : String
    let weight : Int
    let height : Int
    let gender : Gender
    
}

enum Gender: String, CaseIterable, Identifiable {
    case male
    case female
    
    var id: Gender { self }
}
