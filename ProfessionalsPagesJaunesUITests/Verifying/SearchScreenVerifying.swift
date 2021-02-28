//
//  SearchScreenVerifying.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 28/02/2021.
//

import XCTest

protocol SearchScreenVerifying {
    func searchScreenIsShowing() -> Bool
    var searchTable: XCUIElement { get }
}

extension SearchScreenVerifying {
    func searchScreenIsShowing() -> Bool {        
        return searchTable.exists
    }
    
    var searchTable: XCUIElement {
       return XCUIApplication().tables["searchTableView"]
    }
}
