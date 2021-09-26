//
//  ResultBMIView.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 25.09.2021.
//

import SwiftUI

struct ResultBMIView: View {
    
    @ObservedObject var viewModel : ResultBMIViewModel
    
    @State var isPresented = false
    
    init(person: Person) {
        self.viewModel = ResultBMIViewModel(for: person)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Divider()
                Text("BODY MASS INDEX")
                Divider()
                Text(String(format: "%.2f", viewModel.indexBMI))
                let (title, description) = viewModel.result()
                Text("Hello \(viewModel.name), you are \(title)")
                Text(description)
                Text("Ponderal Index: " + String(format: "%.2f", viewModel.indexPI) + " kg/m3")
                HStack {
                    Button(action: actionShare) {
                        HStack {
                            Image("share")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 36, height: 36)
                            Text("Share")
                        }.padding()
                            .background (
                                RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(.gray, lineWidth: 2))
                    }.padding()
                    Button(action: actionSheet) {
                        HStack {
                            Image("rate")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 36, height: 36)
                            Text("Rate")
                        }.padding()
                            .background (
                                RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(.gray, lineWidth: 2))
                    }
                    .sheet(isPresented: $isPresented) {
                        RateView(isPresented: $isPresented)
                    }
                }.padding()
            }.clipShape(Capsule())
                .border(.gray)
//            AdMobView()
        }
    }
    
    private func actionShare() {
        
        let indexBMI = viewModel.indexBMI
        let indexPI = viewModel.indexPI
        let image = UIImage(named: "share")
        
        let activities: [AnyObject] = [image as AnyObject, indexBMI as AnyObject, indexPI as AnyObject]
        
        let activityVC = UIActivityViewController(activityItems: activities, applicationActivities: nil)
        activityVC.excludedActivityTypes = [.addToReadingList, .airDrop, .mail, .message, .postToFacebook, .postToFlickr, .postToTwitter, .print]
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    private func actionSheet() {
        isPresented.toggle()
    }
    
}

struct ResultBMIView_Previews: PreviewProvider {
    static var previews: some View {
        ResultBMIView(person: Person(name: "Alex", weight: 85, height: 185, gender: .male))
    }
}
