//
//  RequestButton.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 07/07/2024.
//

import SwiftUI

struct MainButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Constants.Fonts.montserratMedium16)
                .frame(maxWidth: 352)
                .frame(height: 48)
                .background(Constants.Colors.basicPurple)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
    }
}
