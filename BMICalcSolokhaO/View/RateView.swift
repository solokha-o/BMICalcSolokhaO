//
//  RateView.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 26.09.2021.
//

import SwiftUI

struct RateView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented : Bool
    //TODO: need configure rate for AppStore
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
                Image(systemName: "star")
            }.padding()
            Button("Press to dismiss") {
                presentationMode.wrappedValue.dismiss()
                isPresented = false
            }
            .font(.title)
            .padding()
            .background(Color.black)
        }
    }
}


struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(isPresented: .constant(true))
    }
}
