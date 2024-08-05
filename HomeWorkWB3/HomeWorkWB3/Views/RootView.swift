//
//  ContentView.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 04/08/2024.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var navigationController: CustomNavigationController

    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text(Constants.String.rootView)
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
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environmentObject(CustomNavigationController())
    }
}
