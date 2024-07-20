//
//  Constants.swift
//  TechnoSchoolWB
//
//  Created by David Mikhailov on 20/07/2024.
//

import SwiftUI

struct Constants {
    struct Colors {
        static let basicPurple = Color(red: 132/255, green: 0/255, blue:255/255, opacity: 1)
        static let background = "#1E0537"
    }
    
    struct Fonts {
        static let montserratSemiBold = Font.custom("Montserrat-SemiBold",size: 24)
        static let montserratRegular16 = Font.custom("Montserrat-Regular",size: 16)
        static let montserratRegular14 = Font.custom("Montserrat-Regular",size: 16)
        static let montserratRegular24 = Font.custom("Montserrat-Regular",size: 24)
        static let montserratRegular36 = Font.custom("Montserrat-Regular",size: 36)
        static let montserratMedium16 = Font.custom("Montserrat-Medium",size: 16)
        static let montserratMedium12 = Font.custom("Montserrat-Medium",size: 12)
    }
    
    struct Layout {
        static let padding: CGFloat = 16.0
    }
    
    struct Strings {
        static let authorization = "Авторизация"
        static let toAuthorize = "Авторизоваться"
        static let enterWithPhone = "Вход по номеру телефона"
        static let requestCode = "Запросить код"
        static let phoneMask = "+7 (___) ___ - __ - __"
        static let toBack = "Вернуться назад"
        static let invalidPassword = "Неверный пароль"
    }
    
    struct Images {
        static let avatar = "avatar"
        static let mail = "mail"
        static let background = "background"
    }
}
