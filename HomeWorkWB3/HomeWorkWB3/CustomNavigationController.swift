//
//  NavigationController.swift
//  HomeWorkWB3
//
//  Created by David Mikhailov on 05/08/2024.
//

import SwiftUI

class CustomNavigationController: ObservableObject {
    @Published var viewStack: [(AnyView, AnyTransition)] = []
    
    func push(_ view: AnyView, with animation: Animation? = .easeInOut) {
        withAnimation(animation) {
            viewStack.append((view, .move(edge: .trailing)))
        }
    }
    
    func present(_ view: AnyView, with animation: Animation? = .easeInOut) {
        withAnimation(animation) {
            let transition = AnyTransition.offset(y: UIScreen.main.bounds.height)
            viewStack.append((view, transition))
        }
    }
    
    func custom(_ view: AnyView, with animation: Animation? = .easeInOut) {
          let transition = AnyTransition.scale(scale: 0.1, anchor: .center)
              .combined(with: .opacity)
          
          withAnimation(animation) {
              viewStack.append((view, transition))
          }
      }
    
    func pop() {
        withAnimation {
            if !viewStack.isEmpty {
                viewStack.removeLast()
            }
        }
    }
    
    func popToRoot() {
        withAnimation {
            if !viewStack.isEmpty {
                viewStack.removeAll()
                let rootView = AnyView(RootView())
                viewStack.append((rootView, .identity))
            }
        }
    }
}
