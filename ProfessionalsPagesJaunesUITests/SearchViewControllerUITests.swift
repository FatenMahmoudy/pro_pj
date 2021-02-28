//
//  SearchViewControllerUITests.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 28/02/2021.
//

import XCTest

class SearchViewControllerUITests: UITestCase, SearchViewStarting, SearchScreenVerifying {

    func testViewInteraction() {
        XCTAssertTrue(searchScreenIsShowing())
    }

}
