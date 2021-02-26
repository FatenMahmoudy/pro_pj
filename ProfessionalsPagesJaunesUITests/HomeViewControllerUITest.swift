//
//  HomeViewControllerUITest.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import XCTest

class HomeViewControllerUITest: UITestCase, AppStarting, HomeScreenVerifying {
    
    
    func testTableInteraction() {
        startApp()
        XCTAssertTrue(homeScreenIsShowing())
        XCTAssertTrue(homeNavigationBar.exists)
        XCTAssertTrue(whatTextField.exists)
        XCTAssertTrue(whereTextField.exists)
        XCTAssertTrue(searchButton.exists)
        
        searchButton.tap()
    }
}

