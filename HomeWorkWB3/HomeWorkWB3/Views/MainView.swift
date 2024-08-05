//
//  MainView.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 05/08/2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var navigationController: CustomNavigationController
    
    var body: some View {
        ZStack {
            ForEach(navigationController.viewStack.indices, id: \.self) { index in
                navigationController.viewStack[index].0
                    .zIndex(Double(index))
                    .transition(navigationController.viewStack[index].1)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .onAppear {
            if navigationController.viewStack.isEmpty {
                let rootView = AnyView(RootView())
                navigationController.push(rootView, with: nil)
            }
        }
    }
}

#Preview {
    MainView()
}
