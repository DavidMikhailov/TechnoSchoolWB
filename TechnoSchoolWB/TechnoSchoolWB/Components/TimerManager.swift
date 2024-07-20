//
//  Timer.swift
//  HomeWorkWB
//
//  Created by David Mikhailov on 10/07/2024.
//

import SwiftUI

class TimerManager: ObservableObject {
    @Published var remainingTime: Int
    private var timer: Timer?
    
    init(initialTime: Int) {
        self.remainingTime = initialTime
    }
    
    func start() {
        timer?.invalidate()
        remainingTime = 60
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.timer?.invalidate()
            }
        }
    }
    
    func stop() {
        timer?.invalidate()
    }
}
