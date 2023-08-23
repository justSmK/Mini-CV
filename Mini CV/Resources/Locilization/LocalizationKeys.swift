//
//  LocalizationKeys.swift
//  Mini CV
//
//  Created by Sergei Semko on 8/20/23.
//

import Foundation

// MARK: - Static information

enum LocalizationKeys {
    private static let _cvViewControllerTitle: String = "profile"
    private static let _mySkillsLabel: String = "my_skills"
    private static let _aboutMeLabel: String = "about_me"
}


// MARK: - Dynamic information

extension LocalizationKeys {
    private static let _fullNameLabel: String = "full_name"
    private static let _descriptionText: String = "description"
    private static let _locationText: String = "location"
    private static let _aboutDescriptionText: String = "about_description"
}

// MARK: - Alert information

extension LocalizationKeys {
    private static let _alertTitle: String = "alert_title"
    private static let _alertMessage: String = "alert_message"
    private static let _alertTextFieldPlaceholder: String = "alert_text_field_placeholder"
    private static let _alertCancelAction: String = "alert_cancel_action"
    private static let _alertAddAction: String = "alert_add_action"
}

// MARK: - Get localized strings

extension LocalizationKeys {
    static var cvVCTitle: String {
        return Self._cvViewControllerTitle.localized
    }
    
    static var mySkills: String {
        return Self._mySkillsLabel.localized
    }
    
    static var aboutMe: String {
        return Self._aboutMeLabel.localized
    }
    
    static var fullName: String {
        return Self._fullNameLabel.localized
    }
    
    static var descriptionText: String {
        return Self._descriptionText.localized
    }
    
    static var locationText: String {
        return Self._locationText.localized
    }
    
    static var aboutDescriptionText: String {
        return Self._aboutDescriptionText.localized
    }
}

// MARK: - Alert Manager Keys

extension LocalizationKeys {
    static var alertTitle: String {
        return Self._alertTitle.localized
    }
    
    static var alertMessage: String {
        return Self._alertMessage.localized
    }
    
    static var alertTextFieldPlaceholder: String {
        return Self._alertTextFieldPlaceholder.localized
    }
    
    static var alertCancelAction: String {
        return Self._alertCancelAction.localized
    }
    
    static var alertAddAction: String {
        return Self._alertAddAction.localized
    }
}
