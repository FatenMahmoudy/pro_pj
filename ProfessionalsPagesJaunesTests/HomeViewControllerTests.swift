//
//  HomeViewControllerTests.swift
//  ProfessionalsPagesJaunesTests
//
//  Created by Faten Mahmoudi on 01/03/2021.
//

import XCTest

@testable import ProfessionalsPagesJaunes

class HomeViewControllerTests: XCTestCase {

    var viewControllerUnderTest: HomeViewController!

    override func setUpWithError() throws {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
    func testHasAllView() {
        XCTAssertNotNil(viewControllerUnderTest.whereTextField)
        XCTAssertNotNil(viewControllerUnderTest.whatTextField)
        XCTAssertNotNil(viewControllerUnderTest.scrollView)
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
}
