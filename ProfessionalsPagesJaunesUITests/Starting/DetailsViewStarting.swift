//
//  DetailsViewStarting.swift
//  ProfessionalsPagesJaunesUITests
//
//  Created by Faten Mahmoudi on 01/03/2021.
//

protocol DetailsViewStarting: SearchViewStarting, SearchViewInteracting {
    func startDetailsScreen()
    var indexOfProForTest: Int { get }
}

extension DetailsViewStarting {
    
    func startDetailsScreen() {
        startSearchScreen()
        professional(indexedAt: indexOfProForTest).tap()
    }
    
    func configureStartup() {
        startDetailsScreen()
    }
}
