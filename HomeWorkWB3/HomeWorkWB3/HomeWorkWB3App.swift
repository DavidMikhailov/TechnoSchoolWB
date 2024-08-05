//
//  HomeWorkWB3App.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 04/08/2024.
//

import SwiftUI

@main
struct HomeWorkWB3App: App {
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(CustomNavigationController())
        }
    }
}
