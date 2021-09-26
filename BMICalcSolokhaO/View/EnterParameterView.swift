//
//  EnterParameterView.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 24.09.2021.
//

import SwiftUI

struct EnterParameterView: View {
    
    @State var enteredName = ""
    
    private let pickerRange = Range(1...200)
    
    @State var selectedWeight = 1
    @State var selectedHeight = 1
    @State private var selectedGender = Gender.male
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Text("Enter Personal Detail")
                        .padding()
                    TextField("Name", text: $enteredName)
                        .border(.gray)
                        .padding()
                    Text("Calculate Your Body Mass Index")
                        .padding()
                    HStack {
                        Text("Weight")
                            .padding()
                        Text("Height")
                            .padding()
                        Text("Gender")
                            .padding()
                    }
                    HStack{
                        Picker("Weight", selection: $selectedWeight) {
                            ForEach(pickerRange, id: \.self) {
                                Text("\($0)")
                            }
                        }.labelsHidden()
                            .pickerStyle(.wheel)
                            .frame(width: geometry.size.width/6)
                            .padding()
                        Picker("Height", selection: $selectedHeight) {
                            ForEach(pickerRange, id: \.self) {
                                Text("\($0)")
                            }
                        }.labelsHidden()
                            .pickerStyle(.wheel)
                            .frame(width: geometry.size.width/6)
                            .padding()
                        Picker("Gender", selection: $selectedGender) {
                            ForEach(Gender.allCases) { color in
                                Text(color.rawValue.capitalized)
                            }
                        }.labelsHidden()
                            .pickerStyle(.wheel)
                            .frame(width: geometry.size.width/5)
                            .padding()
                    } .clipShape(Capsule())
                        .border(.gray)
                    NavigationLink {
                        let person = Person(name: enteredName, weight: selectedWeight, height: selectedHeight, gender: selectedGender)
                        ResultBMIView(person: person).navigationTitle("BMI Details")
                    } label: {
                        Text("Calculate")
                    }.padding()
                }
            }
        }
    }
}

struct EnterParameterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterParameterView()
    }
}
