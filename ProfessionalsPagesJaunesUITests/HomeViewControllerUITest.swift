//
//  HomeViewControllerUITest.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import XCTest

class HomeViewControllerUITest: UITestCase, RootViewStarting, HomeScreenVerifying, FavoritesScreenVerifying {
    
    
    func testViewInteraction() {
        XCTAssertTrue(homeScreenIsShowing())
        XCTAssertTrue(homeNavigationBar.exists)
        XCTAssertTrue(whatTextField.exists)
        XCTAssertTrue(whereTextField.exists)
        XCTAssertTrue(searchButton.exists)
        
        searchButton.tap()
    }
    
    func testNavigateToFavorites() {
        favoritesButton.tap()
        XCTAssertTrue(favoritesScreenIsShowing())
    }
}

