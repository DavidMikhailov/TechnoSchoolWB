//
//  ReusableVStack.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 07/07/2024.
//

import SwiftUI

struct ReusableVStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            content
            Spacer()
        }
        .frame(height: 429)
        .frame(maxWidth: 400)
        .background(Color.black.opacity(0.5))
        .cornerRadius(20)
    }
}
