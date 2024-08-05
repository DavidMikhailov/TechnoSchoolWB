//
//  PresentView.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 05/08/2024.
//

import SwiftUI

struct PresentView: View {
    @EnvironmentObject var navigationController: CustomNavigationController

    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            
            NavigationButtonsStack(title: Constants.String.presentView)
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentView().environmentObject(CustomNavigationController())
    }
}
