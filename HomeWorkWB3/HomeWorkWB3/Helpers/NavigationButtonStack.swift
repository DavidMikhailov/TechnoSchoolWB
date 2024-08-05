//
//  NavigationButtonStack.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 05/08/2024.
//

import SwiftUI

struct NavigationButtonsStack: View {
    let title: String
    @EnvironmentObject var navigationController: CustomNavigationController

    var body: some View {
        VStack {
            Text(title)
                .font(.largeTitle)
                .padding()
            
            NavigationButton(title: Constants.String.push) {
                let pushView = AnyView(PushView())
                navigationController.push(pushView)
            }
            
            NavigationButton(title: Constants.String.present) {
                let presentView = AnyView(PresentView())
                navigationController.present(presentView)
            }
            
            NavigationButton(title: Constants.String.custom) {
                let customView = AnyView(CustomView())
                navigationController.custom(customView)
            }
            
            NavigationButton(title: Constants.String.back) {
                navigationController.pop()
            }
            
            NavigationButton(title: Constants.String.backToRootView) {
                navigationController.popToRoot()
            }
        }
    }
}
