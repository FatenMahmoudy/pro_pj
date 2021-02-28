//
//  DetailsScreenVerifying.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 01/03/2021.
//

import XCTest

protocol DetailsScreenVerifying {
    func detailsScreenIsShowing() -> Bool
    var callButton: XCUIElement { get }
    var nameLabel: XCUIElement { get }
    var addressLabel: XCUIElement { get }
    var addToFavoritesButton: XCUIElement { get }
}

extension DetailsScreenVerifying {
    func detailsScreenIsShowing() -> Bool {
        return callButton.exists && nameLabel.exists && addressLabel.exists && addToFavoritesButton.exists
    }
    
    var callButton: XCUIElement {
        let app = XCUIApplication()
        return app.buttons["callButton"]
    }
    
    var nameLabel: XCUIElement {
        let app = XCUIApplication()
        return app.staticTexts["nameLabel"]
    }
    
    var addressLabel: XCUIElement {
        let app = XCUIApplication()
        return app.staticTexts["addressLabel"]
    }
    
    var addToFavoritesButton: XCUIElement {
        let app = XCUIApplication()
        return app.buttons["addToFavoritesButton"]
    }
}
