//
//  DetailsViewControllerUITests.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 01/03/2021.
//

import XCTest

class DetailsViewControllerUITests: UITestCase, DetailsViewStarting, DetailsScreenVerifying {
    
    let indexOfProForTest = 0

    func testViewInteraction() {
        XCTAssertTrue(detailsScreenIsShowing())
        addToFavoritesButton.tap()
        callButton.tap()
    }

}
