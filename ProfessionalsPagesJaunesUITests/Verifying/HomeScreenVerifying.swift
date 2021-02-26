//
//  HomeScreenVerifying.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import XCTest

protocol HomeScreenVerifying {
    func homeScreenIsShowing() -> Bool
    var homeScrollView: XCUIElement { get }
    var whatTextField: XCUIElement { get }
    var whereTextField: XCUIElement { get }
    var homeNavigationBar: XCUIElement { get }
    var searchButton: XCUIElement { get }
}

extension HomeScreenVerifying {
    func homeScreenIsShowing() -> Bool {
        return homeNavigationBar.exists
    }
    
    var whereTextField: XCUIElement {
        return XCUIApplication().textFields["whereTextField"]
    }
    
    var whatTextField: XCUIElement {
       return XCUIApplication().textFields["whatTextField"]
    }
    
    var homeScrollView: XCUIElement {
        return XCUIApplication().scrollViews["homeScrollView"]
    }
    
    var homeNavigationBar: XCUIElement {
       return XCUIApplication().navigationBars["homeNavigationBar"]
    }

    var searchButton: XCUIElement {
        return XCUIApplication().buttons["searchButton"]
    }
}

