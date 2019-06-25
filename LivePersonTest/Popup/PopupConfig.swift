//
//  PopupConfig.swift
//  LivePersonTest
//
//  Created by Aleksandr Ponomarenko on 6/24/19.
//  Copyright © 2019 AS Developers. All rights reserved.
//

import Foundation

enum PopupType {
    case start, first, second, third, fourth, success
}

struct PopupConfigModel {
    
    let image: String?
    let title: String
    let subtitle: String?
    let hasInputField: Bool
    let fieldPlaceholder: String?
    let confirmButton: String?
    let dismissButton: String
    
    init(imageName: String?, title: String, subtitle: String?, hasInputField: Bool, fieldPlaceholder: String?, confirmButton: String?, dismissButton: String) {
        self.image = imageName
        self.title = title
        self.subtitle = subtitle
        self.hasInputField = hasInputField
        self.fieldPlaceholder = fieldPlaceholder
        self.confirmButton = confirmButton
        self.dismissButton = dismissButton
    }
}

class PopupConfigBuilder {
    
    private class func startPopupConfig() -> PopupConfigModel {
        return PopupConfigModel(imageName: "logo",
                                title: "Get The Most Out of Kasamba",
                                subtitle: "Subscribe Today & Enjoy Tidbits of Wisdom, Special Offers, Promotions and More!",
                                hasInputField: true,
                                fieldPlaceholder: "Email address",
                                confirmButton: "Sounds Good!",
                                dismissButton: "Maybe later")
    }
    
    private class func successPopupConfig() -> PopupConfigModel {
        return PopupConfigModel(imageName: "hands",
                                title: "Great! We'll be in touch soon!",
                                subtitle: nil,
                                hasInputField: false,
                                fieldPlaceholder: nil,
                                confirmButton: nil,
                                dismissButton: "Close")
    }
    
    private class func firstPopupConfig() -> PopupConfigModel {
        return PopupConfigModel(imageName: nil,
                                title: "Don't miss out",
                                subtitle: "Subscribe for special offers, promotions, tidbits of wisdom and personal horoscope",
                                hasInputField: true,
                                fieldPlaceholder: "Email address",
                                confirmButton: "Send",
                                dismissButton: "Maybe Later")
    }
    
    private class func secondPopupConfig() -> PopupConfigModel {
        return PopupConfigModel(imageName: nil,
                                title: "We have more to offer than powerful psychics!",
                                subtitle: "Gut the most of experience by subscribing for inpiring wisdoms, special offers and promotions!",
                                hasInputField: true,
                                fieldPlaceholder: "Email address",
                                confirmButton: "Subscribe",
                                dismissButton: "Maybe Later")
    }
    
    private class func thirdPopupConfig() -> PopupConfigModel {
        return PopupConfigModel(imageName: nil,
                                title: "Don't Walk Your Spirutal Path Alone",
                                subtitle: "We want to be there for you on every step of the way. Subscribe today for inpiring wisdoms, special offers and promotions!",
                                hasInputField: true,
                                fieldPlaceholder: "Email address",
                                confirmButton: "Join Us",
                                dismissButton: "Maybe Later")
    }
    
    private class func fourthPopupConfig() -> PopupConfigModel {
        return PopupConfigModel(imageName: nil,
                                title: "Want to Save on Your Psyhic Reading",
                                subtitle: "Along with useful wisdom and insights, we send our subscribers special offers and promotions",
                                hasInputField: true,
                                fieldPlaceholder: "Email address",
                                confirmButton: "Send",
                                dismissButton: "No Thank You")
        
    }
    
    class func popupConfig(with type: PopupType) -> PopupConfigModel {
        switch type {
        case .start:
            return startPopupConfig()
        
        case .success:
            return successPopupConfig()
        
        case .first:
            return firstPopupConfig()
        
        case .second:
            return secondPopupConfig()
        
        case .third:
            return thirdPopupConfig()
        
        case .fourth:
            return fourthPopupConfig()
            
        }
    }
}
