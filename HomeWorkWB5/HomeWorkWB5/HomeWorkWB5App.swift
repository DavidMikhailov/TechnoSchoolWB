//
//  HomeWorkWB5App.swift
//  HomeWorkWB5
//
//  Created by David Mikhailov on 17/08/2024.
//

import SwiftUI

@main
struct HomeWorkWB5App: App {
    @StateObject private var localizationManager = LocalizationManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(localizationManager)
        }
    }
}
