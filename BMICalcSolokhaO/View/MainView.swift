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
                EnterParameterView().navigationBarTitle("Add BMI Details")                .navigationBarTitleDisplayMode(.large)
                    .navigationBarGradient(ColorDesign.gradient, startPoint: .topLeading, endPoint: .bottomTrailing)
            } label: {
                Image(viewModel.imageName)
            }
            .navigationViewStyle(.stack)
            .padding()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
        
    static var previews: some View {
        MainView()
    }
}
