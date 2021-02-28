//
//  HomeViewInteracting.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 28/02/2021.
//

import XCTest

protocol HomeViewInteracting {
    func search() -> XCUIElement
}

extension HomeViewInteracting {
    func search() -> XCUIElement {
        return XCUIApplication().buttons["searchButton"]
    }
}
