//
//  DateView.swift
//  HomeWorkWB5
//
//  Created by David Mikhailov on 17/08/2024.
//

import SwiftUI

struct DateView: View {
    @EnvironmentObject var localizationManager: LocalizationManager
    
    var body: some View {
        VStack {
            Text("\(NSLocalizedString(localizationManager.localizedString(forKey: "short"), comment: "")): \(formattedDate(date: Date(), style: .short))")
            Text("\(NSLocalizedString(localizationManager.localizedString(forKey: "medium"), comment: "")): \(formattedDate(date: Date(), style: .medium))")
            Text("\(NSLocalizedString(localizationManager.localizedString(forKey: "long"), comment: "")): \(formattedDate(date: Date(), style: .long))")
        }
    }
    
    func formattedDate(date: Date, style: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = style
        formatter.timeStyle = style
        return formatter.string(from: date)
    }
}
