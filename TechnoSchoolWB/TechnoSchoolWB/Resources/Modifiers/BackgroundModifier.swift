//
//  BackgroundModifier.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 03/07/2024.
//

import SwiftUI

struct BackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color(hex: Constants.Colors.background)
                .edgesIgnoringSafeArea(.all)
            Image(Constants.Images.background)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            content
        }
    }
}

extension View {
    func withBackground() -> some View {
        self.modifier(BackgroundModifier())
    }
}
