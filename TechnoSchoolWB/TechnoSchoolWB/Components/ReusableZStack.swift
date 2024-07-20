//
//  ReusableZStack.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 07/07/2024.
//

import SwiftUI

struct ReusableZStack<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            content
        }
        .contentShape(Rectangle())
        .onTapGesture {
            hideKeyboard()
        }
    }
}
