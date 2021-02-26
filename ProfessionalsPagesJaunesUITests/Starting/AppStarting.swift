//
//  AppStarting.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import XCTest

protocol AppStarting {
    func startApp()
}

extension AppStarting {
    func startApp() {
        XCUIApplication().launch()
        sleep(10)
    }
}
