//
//  SearchViewStarting.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 28/02/2021.
//

import XCTest

protocol SearchViewStarting: RootViewStarting, HomeScreenVerifying {
    func startSearchScreen()
}

extension SearchViewStarting {
    func startSearchScreen() {
        startRootView()
        
        whatTextField.tap()
        whatTextField.typeText("medecin")
        
        whereTextField.tap()
        whereTextField.typeText("paris")
        //first tap to dismiss keyboard
        //     we can tap anywhere
        //second tap to click on button
        searchButton.tap()
        searchButton.tap()
    }
    
    func configureStartup() {
        startSearchScreen()
    }
}

