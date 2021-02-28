//
//  FavoritesViewStarting.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 28/02/2021.
//

import XCTest

protocol FavoritesViewStarting: RootViewStarting {
    func startFavoritesScreen()
}

extension FavoritesViewStarting {
    func startFavoritesScreen() {
        startRootView()
        XCUIApplication().navigationBars.buttons["favoritesButton"].tap()
    }
    
    func configureStartup() {
        startFavoritesScreen()
    }
}
