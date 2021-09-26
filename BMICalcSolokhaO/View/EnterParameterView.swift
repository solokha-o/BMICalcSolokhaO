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
    
    @State var selectedWeight = 50
    @State var selectedHeight = 100
    @State private var selectedGender = Gender.male
    
    var body: some View {
        
        VStack {
            Text("Enter Personal Detail")
                .padding()
                .font(.system(.largeTitle, design: .rounded))
                .foregroundColor(Color(UIColor.hexStringToUIColor(hex: "#19769F")))
            TextField("Name", text: $enteredName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.largeTitle)
            Text("Calculate Your Body Mass Index")
                .foregroundColor(.gray)
                .padding()
            HStack {
                Text("Weight")
                    .padding()
                Spacer()
                Text("Height")
                    .padding()
                Spacer()
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
                    .frame(width: UIScreen.main.bounds.size.width/5, alignment: .center)
                    .clipped()
                    .contentShape(Rectangle())
                    .padding()
                Spacer()
                Picker("Height", selection: $selectedHeight) {
                    ForEach(pickerRange, id: \.self) {
                        Text("\($0)")
                    }
                }.labelsHidden()
                    .pickerStyle(.wheel)
                    .frame(width: UIScreen.main.bounds.size.width/5, alignment: .center)
                    .clipped()
                    .contentShape(Rectangle())
                    .padding()
                Spacer()
                Picker("Gender", selection: $selectedGender) {
                    ForEach(Gender.allCases) { color in
                        Text(color.rawValue.capitalized)
                    }
                }.labelsHidden()
                    .pickerStyle(.wheel)
                    .frame(width: UIScreen.main.bounds.size.width/5, alignment: .center)
                    .clipped()
                    .contentShape(Rectangle())
                    .padding()
            }.border(.gray)
                .shadow(color: .gray, radius: 10, x: 5, y: 0)
                .padding()
            NavigationLink {
                let person = Person(name: enteredName, weight: selectedWeight, height: selectedHeight, gender: selectedGender)
                ResultBMIView(person: person).navigationBarTitle("BMI Details") .navigationBarTitleDisplayMode(.large)
                
            } label: {
                Text("Calculate")
                    .font(.system(.title, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
            }.background(ColorDesign.gradientColor.cornerRadius(10))
                .padding()
        }
    }
}

struct EnterParameterView_Previews: PreviewProvider {
    static var previews: some View {
        EnterParameterView()
    }
}
