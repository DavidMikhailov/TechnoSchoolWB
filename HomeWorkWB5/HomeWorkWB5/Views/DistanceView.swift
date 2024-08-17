//
//  DistanceView.swift
//  HomeWorkWB5
//
//  Created by David Mikhailov on 17/08/2024.
//

import SwiftUI

struct DistanceView: View {
    @EnvironmentObject var localizationManager: LocalizationManager
    
    let meters = 123.0
    
    var body: some View {
        VStack {
            Text("\(NSLocalizedString(localizationManager.localizedString(forKey: "distance"), comment: ""))")
                .font(.title)
                .padding()
            Text("\(NSLocalizedString(localizationManager.localizedString(forKey: "meters"), comment: "")): \(String(format: "%.0f", meters)) m")
            Text("\(NSLocalizedString(localizationManager.localizedString(forKey: "kilometers"), comment: "")): \(convertDistance(meters: meters, to: .kilometers))")
            Text("\(NSLocalizedString(localizationManager.localizedString(forKey: "miles"), comment: "")): \(convertDistance(meters: meters, to: .miles))")
        }
    }
    
    func convertDistance(meters: Double, to unit: UnitLength) -> String {
        let measurement = Measurement(value: meters, unit: UnitLength.meters)
        let convertedMeasurement = measurement.converted(to: unit)
        let formatter = MeasurementFormatter()
        formatter.unitStyle = .medium
        formatter.locale = Locale.current
        return formatter.string(from: convertedMeasurement)
    }
}
