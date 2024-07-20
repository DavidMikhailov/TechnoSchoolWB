//
//  CodeInputField.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 07/07/2024.
//

import SwiftUI

struct CodeInputTextField: View {
    @Binding var code: String
    @Binding var isValidCode: Bool
    @Binding var isCodeSubmitted: Bool
    
    var body: some View {
        VStack {
            ZStack {
                HStack(spacing: 24) {
                    ForEach(0..<4, id: \.self) { index in
                        Text(index < code.count ? String(code[code.index(code.startIndex, offsetBy: index)]) : " ")
                            .frame(width: 64, height: 80)
                            .background(Color.white.opacity(0.08))
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .font(Constants.Fonts.montserratRegular36)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12).stroke(isCodeSubmitted ? (isValidCode ? Color.green : Color.red) : Color.clear, lineWidth: 2)
                            )
                    }
                }
                
                TextField("", text: $code)
                    .keyboardType(.numberPad)
                    .foregroundColor(.clear)
                    .accentColor(.clear)
                    .textContentType(.oneTimeCode)
                    .onChange(of: code) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        if filtered.count <= 4 {
                            code = filtered
                        } else {
                            code = String(filtered.prefix(4))
                        }
                    }
            }
            
            if !isValidCode {
                Text(Constants.Strings.invalidPassword)
                    .foregroundColor(.red)
                    .font(Constants.Fonts.montserratRegular14)
                    .padding(.top, 12)
            }
        }
    }
}
