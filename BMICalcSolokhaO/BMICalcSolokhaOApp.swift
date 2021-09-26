//
//  BMICalcSolokhaOApp.swift
//  BMICalcSolokhaO
//
//  Created by Oleksandr Solokha on 24.09.2021.
//

import SwiftUI

@main
struct BMICalcSolokhaOApp: App {
    
    ///adapt app for AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
