//
//  LocalizationService.swift
//  HomeWorkWB5
//
//  Created by David Mikhailov on 17/08/2024.
//

import SwiftUI

class LocalizationManager: ObservableObject {
    static let shared = LocalizationManager()
       
       @Published var currentLanguage: String {
           didSet {
               UserDefaults.standard.set(currentLanguage, forKey: "appLanguage")
               setLanguage(currentLanguage)
           }
       }
       
       private var bundle: Bundle?
       
    init() {
           self.currentLanguage = UserDefaults.standard.string(forKey: "appLanguage") ?? Locale.current.language.languageCode?.identifier ?? "en"
           setLanguage(currentLanguage)
       }
       
       func setLanguage(_ language: String) {
           if let path = Bundle.main.path(forResource: language, ofType: "lproj") {
               bundle = Bundle(path: path)
           } else {
               bundle = Bundle.main
           }
       }
       
       func localizedString(forKey key: String) -> String {
           return bundle?.localizedString(forKey: key, value: nil, table: nil) ?? key
       }
}
