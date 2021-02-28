//
//  FavoritesScreenVerifying.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 28/02/2021.
//

import XCTest

protocol FavoritesScreenVerifying {
    func favoritesScreenIsShowing() -> Bool
    var favoritesNavigationBar: XCUIElement { get }
}

extension FavoritesScreenVerifying {
    func favoritesScreenIsShowing() -> Bool {
        return favoritesNavigationBar.exists
    }
    
    var favoritesNavigationBar: XCUIElement {
       return XCUIApplication().navigationBars["favoritesNavigationBar"]
    }
    
}
