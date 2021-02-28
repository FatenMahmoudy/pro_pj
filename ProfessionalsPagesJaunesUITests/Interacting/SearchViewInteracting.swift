//
//  SearchViewInteracting.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 01/03/2021.
//

import XCTest

protocol SearchViewInteracting {
    func professional(indexedAt: Int) -> XCUIElement
}

extension SearchViewInteracting {
    func professional(indexedAt index: Int) -> XCUIElement {
        return XCUIApplication().cells.element(boundBy: index)
    }
}
