//
//  AppDelegate.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 26.09.2021.
//

import SwiftUI
import Firebase
import GoogleMobileAds

class AppDelegate: NSObject, UIApplicationDelegate {
    private func applicationDidFinishLaunching(_ notification: Notification) {
        
        // Use Firebase library to configure APIs.
        FirebaseApp.configure()
        
        // Initialize the Google Mobile Ads SDK.
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
}
