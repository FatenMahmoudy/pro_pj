//
//  RootViewStarting.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

protocol RootViewStarting: StartupConfigurable, AppStarting {
    func startRootView()
}

extension RootViewStarting {
    
    func startRootView() {
        startApp()
    }
    
    func configureStartup() {
        startRootView()
    }
}
