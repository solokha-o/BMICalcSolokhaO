//
//  ContentView.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 24.09.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            NavigationLink {
                EnterParameterView().navigationTitle("Add BMI Details")
            } label: {
                Image(viewModel.imageName)
            }
            .padding()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
        
    static var previews: some View {
        MainView()
    }
}
