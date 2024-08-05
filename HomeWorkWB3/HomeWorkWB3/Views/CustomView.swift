//
//  CustomView.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 05/08/2024.
//

import SwiftUI

struct CustomView: View {
    @EnvironmentObject var navigationController: CustomNavigationController

    var body: some View {
        ZStack {
            Color.cyan
                .edgesIgnoringSafeArea(.all)
            
            NavigationButtonsStack(title: Constants.String.customView)
        }
    }
}

struct CustomView_Previews: PreviewProvider {
    static var previews: some View {
        CustomView().environmentObject(CustomNavigationController())
    }
}
