//
//  PushView.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 05/08/2024.
//

import SwiftUI

struct PushView: View {
    @EnvironmentObject var navigationController: CustomNavigationController

    var body: some View {
        ZStack {
            Color.pink
                .edgesIgnoringSafeArea(.all)
            
            NavigationButtonsStack(title: Constants.String.pushView)
        }
    }
}

struct PushView_Previews: PreviewProvider {
    static var previews: some View {
        PushView().environmentObject(CustomNavigationController())
    }
}
