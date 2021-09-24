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
    
    
    private enum FavoriteColor: String, CaseIterable, Identifiable {
        case red
        case green
        case blue
        
        var id: FavoriteColor { self }
    }
    
    @State var selectedWeight = 1
    @State var selectedHeight = 1
    @State private var selectedColor = FavoriteColor.red
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    Text("Enter Personal Detail")
                    TextField("Name", text: $enteredName)
                        .border(.gray)
                    Text("Calculate Your Body Mass Index")
                    HStack {
                        Text("Weight")
                        Text("Height")
                        Text("Gender")
                    }
                    HStack{
                        Picker("Weight", selection: $selectedWeight) {
                            ForEach(pickerRange, id: \.self) {
                                Text("\($0)")
                            }
                        }.labelsHidden()
                            .pickerStyle(.wheel)
                            .frame(width: geometry.size.width/3)
                        Picker("Height", selection: $selectedHeight) {
                            ForEach(pickerRange, id: \.self) {
                                Text("\($0)")
                            }
                        }.labelsHidden()
                            .pickerStyle(.wheel)
                            .frame(width: geometry.size.width/3)
                        Picker("Gender", selection: $selectedColor) {
                            ForEach(FavoriteColor.allCases) { color in
                                Text(color.rawValue.capitalized)
                            }
                        }.labelsHidden()
                            .pickerStyle(.wheel)
                            .frame(width: geometry.size.width/3)
                    } .clipShape(Capsule())
                        .border(.gray)
                    
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
