//
//  NavigationButton.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 05/08/2024.
//

import SwiftUI

struct NavigationButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.white, lineWidth: 2)
                )
        }
        .padding()
    }
}
