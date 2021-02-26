//
//  UITestCase.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import XCTest

class UITestCase: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        // If the test is StartupConfigurable test, then call configureStartup()
        (self as? StartupConfigurable)?.configureStartup()
    }

}
