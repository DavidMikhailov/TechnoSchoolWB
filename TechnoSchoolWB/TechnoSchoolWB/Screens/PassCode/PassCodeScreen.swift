//
//  PassCodeScreen.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 07/07/2024.
//

import SwiftUI

struct PassCodeScreen: View {
    var phoneNumber: String
    @State private var code: String = ""
    @State private var isValidCode: Bool = true
    @State private var isCodeSubmitted: Bool = false
    @State private var showError: Bool = true
    @StateObject private var timerManager = TimerManager(initialTime: 60)
    @FocusState private var isTextFieldFocused: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ReusableZStack {
            VStack {
                ReusableVStack {
                    mailImage
                    
                    phoneLabel
                    
                    codeInputFeild
                    
                    timerLabel
                    
                    authButton
                }
                backButton
            }
            .withBackground()
        }
        .onAppear {
            isTextFieldFocused = true
            timerManager.start()
        }
        .onDisappear {
            timerManager.stop()
        }
    }
}

// MARK: - Private extension

private extension PassCodeScreen {
    var mailImage: some View {
        Image(Constants.Images.mail)
            .resizable()
            .scaledToFit()
            .frame(width: 35, height: 27.5)
            .padding(.top, 46)
    }
    
    var phoneLabel: some View {
        Text(phoneNumber)
            .font(Constants.Fonts.montserratRegular24)
            .foregroundColor(.white)
            .padding(.top, 16)
    }
    var codeInputFeild: some View {
        CodeInputTextField(
            code: $code,
            isValidCode: $isValidCode,
            isCodeSubmitted: $isCodeSubmitted
        )
        .focused($isTextFieldFocused)
        .frame(width: 400, height: 128)
        .cornerRadius(12)
        .padding(.top, 24)
    }
    
    var timerLabel: some View {
        Text("Запросить повторно через \(timerManager.remainingTime) сек.")
            .font(Constants.Fonts.montserratRegular14)
            .foregroundColor(.white)
            .padding(.top, 15)
    }
    
    var authButton: some View {
        MainButton(title: Constants.Strings.toAuthorize) {
            isCodeSubmitted = true
            validateCode()
        }
        .padding(.top, 24)
    }
    
    var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        },
               label: {
            Text("\(Image(systemName: "chevron.left")) \(Constants.Strings.toBack)")
                .font(Constants.Fonts.montserratRegular14)
                .foregroundColor(.white)
        })
        .padding(.top, 33.5)
    }
    
    private func validateCode() {
        isValidCode = (code == "1234")
    }
}


#Preview {
    PassCodeScreen(phoneNumber: "+7 (999) 999-99-99")
}
