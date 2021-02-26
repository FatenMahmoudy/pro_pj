//
//  ProfessionalsViewControllerTests.swift
//  ProfessionalsPagesJaunesTests
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import XCTest

@testable import ProfessionalsPagesJaunes

class ProfessionalsViewControllerTests: XCTestCase {

    var viewControllerUnderTest: ProfessionalsViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewControllerUnderTest = storyboard.instantiateViewController(withIdentifier: "ProfessionalsViewController") as? ProfessionalsViewController
        
        self.viewControllerUnderTest.loadView()
        self.viewControllerUnderTest.viewDidLoad()
    }
    
    func testHasATableView() {
        XCTAssertNotNil(viewControllerUnderTest.tableView)
    }
    
    func testTableViewHasDelegate() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.delegate)
    }
    
    func testTableViewConfromsToTableViewDelegateProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDelegate.self))
    }
    
    func testTableViewHasDataSource() {
        XCTAssertNotNil(viewControllerUnderTest.tableView.dataSource)
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testTableViewConformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(viewControllerUnderTest.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(viewControllerUnderTest.responds(to: #selector(viewControllerUnderTest.tableView(_:cellForRowAt:))))
    }

}
