//
//  ContentView.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 30/06/2024.
//

import SwiftUI

struct AuthorizationScreen: View {
    
    @State private var phoneNumber: String = Constants.Strings.phoneMask
    @State private var isEditing: Bool = false
    @State private var showError: Bool = false
    @State private var navigateToPassCodeScreen = false
    
    var body: some View {
        NavigationStack {
            ReusableZStack {
                ReusableVStack {
                    authoriztaionTitle
                    
                    avatarImage
                    
                    enterWithPhoneNumberTitle
                    
                    PhoneNumberTextField(phoneNumber: $phoneNumber, showError: $showError)
                    
                    requestCodeButton
                }
                .withBackground()
            }
            .navigationDestination(isPresented: $navigateToPassCodeScreen) {
                PassCodeScreen(phoneNumber: phoneNumber).navigationBarBackButtonHidden(true)
            }
        }
    }
}

// MARK: - Private extension

private extension AuthorizationScreen {
    var authoriztaionTitle: some View {
        Text(Constants.Strings.authorization)
            .font(Constants.Fonts.montserratSemiBold)
            .foregroundColor(.white)
            .padding(.top, 40)
    }
    
    var avatarImage: some View {
        Image(Constants.Images.avatar)
            .resizable()
            .scaledToFit()
            .frame(width: 96, height: 96)
            .padding(.top, 28)
    }
    var enterWithPhoneNumberTitle: some View {
        Text(Constants.Strings.enterWithPhone)
            .font(Constants.Fonts.montserratRegular16)
            .foregroundColor(.white)
            .padding(.top, 16)
            .padding(.bottom, 32)
    }
    
    var requestCodeButton: some View {
        MainButton(title: Constants.Strings.requestCode) {
            if phoneNumber.filter({ $0.isNumber }).count < 11 {
                showError = true
            } else {
                showError = false
                navigateToPassCodeScreen = true
            }
        }
        .padding(.top, 24)
    }
}

#Preview {
    AuthorizationScreen()
}
