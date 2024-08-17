//
//  ContentView.swift
//  HomeWorkWB5
//
//  Created by David Mikhailov on 17/08/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var localizationManager: LocalizationManager
    
    var body: some View {
        VStack {
            Text(localizationManager.localizedString(forKey: "greeting"))
                .font(.title)
            .padding()
            DateView()
                .environmentObject(localizationManager)
            DistanceView()
                .environmentObject(localizationManager)
            Button {
                localizationManager.currentLanguage = localizationManager.currentLanguage == "en" ? "ru" : "en"
            } label: {
                Text(NSLocalizedString(localizationManager.localizedString(forKey: "change_language"), comment: ""))
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.white, lineWidth: 2)
                    )
            }
        }
    }
}

#Preview {
    MainView()
}
