//
//  PhoneNumberTextField.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 07/07/2024.
//

import SwiftUI

struct PhoneNumberTextField: View {
    @Binding var phoneNumber: String
    @Binding var showError: Bool
    
    
    var body: some View {
        ZStack {
            if showError {
                Text("Некорретный формат номера")
                    .foregroundStyle(.red)
                    .font(Constants.Fonts.montserratMedium12)
                    .padding(.bottom, 18.5)
                    .padding(.trailing, 132)
            }
            
            if phoneNumber.isEmpty {
                Text(Constants.Strings.phoneMask)
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
            }
            
            TextField("", text: $phoneNumber)
                .padding()
                .padding(.top, showError ? 17.5 : 0)
                .frame(maxWidth: 352)
                .frame(height: 48)
                .keyboardType(.phonePad)
                .foregroundColor(.white)
                .font(Constants.Fonts.montserratMedium16)
                .background(Color.white.opacity(0.08))
                .cornerRadius(12)
                .padding(.horizontal)
                .onChange(of: phoneNumber) { newValue in
                    phoneNumber = formatPhoneNumber(input: newValue)
                    if phoneNumber.filter({ $0.isNumber }).count == 11 {
                        showError = false
                    }
                }
            
                .showClearButton($phoneNumber)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(showError ? Color.red : Color.clear)
                        .frame(height: 48)
                        .padding()
                )
        }
    }
    
    private func formatPhoneNumber(input: String) -> String {
        let cleanNumber = input.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        let cleanNumberWithoutPrefix = cleanNumber.hasPrefix("7") ? String(cleanNumber.dropFirst()) : cleanNumber
        
        let mask = "(___) ___ - __ - __"
        
        var result = "+7 "
        var startIndex = cleanNumberWithoutPrefix.startIndex
        let endIndex = cleanNumberWithoutPrefix.endIndex
        
        for char in mask where startIndex < endIndex {
            if char == "_" {
                result.append(cleanNumberWithoutPrefix[startIndex])
                startIndex = cleanNumberWithoutPrefix.index(after: startIndex)
            } else {
                result.append(char)
            }
        }
        
        return result
    }
}

