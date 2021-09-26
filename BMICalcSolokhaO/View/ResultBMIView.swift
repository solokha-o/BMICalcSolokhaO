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
        VStack {
            VStack {
                Divider()
                    .background(Color.white)
                Text("BODY MASS INDEX")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                Divider()
                    .background(Color.white)
                Text(String(format: "%.2f", viewModel.indexBMI))
                    .underline()
                    .foregroundColor(.white)
                    .font(Font.system(size: 72))
                    .padding()
                let (title, description) = viewModel.result()
                Text("Hello \(viewModel.name), you are \(title)")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                Text(description)
                    .foregroundColor(.white)
                    .padding()
                Text("Ponderal Index: " + String(format: "%.2f", viewModel.indexPI) + " kg/m3")
                    .foregroundColor(.white)
                    .padding()
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
                                    .strokeBorder(.white, lineWidth: 4))
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
                                    .strokeBorder(.white, lineWidth: 4))
                    }
                    .sheet(isPresented: $isPresented) {
                        RateView(isPresented: $isPresented)
                    }
                }.padding()
            }.clipShape(Capsule())
                .background(ColorDesign.gradientColor.cornerRadius(10))
                .padding()
            AdMobView()
                .padding()
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
