//
//  NetworkLayerTests.swift
//  ProfessionalsPagesJaunesTests
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import XCTest

@testable import ProfessionalsPagesJaunes

class NetworkLayerTests: XCTestCase {

    let networking = Networking()
    var searchResult: SearchResult?
    var professionals: Professionals?
    
    func testDecodingResponse() throws {
        let jsonObject = "{\"search_results\": {\"listings\": [{\"inscriptions\": [{\"address_city\": \"PARIS\",\"address_street\": \"81 r St Dominique\",\"address_zipcode\": \"75007\",\"contact_info\": [{\"contact_type\": \"TELEPHONE\",\"contact_value\": \"01 45 50 30 26\",\"no_direct_marketing\": true}]}],\"listing_id\": \"FCP014550302656308881H001C0001\",\"merchant_id\": \"56308881\",\"merchant_name\": \"Sothea Sar\",}]}}".data(using: .utf8)
        
        let response = Response(data: jsonObject!)
        guard let decoded = response.decode(SearchResult.self) else {
            return
        }
        XCTAssertTrue(false == decoded.search_results?.listings.isEmpty)
        XCTAssertTrue(decoded.search_results?.listings[0].merchant_name == "Sothea Sar")
    }
    
    func testPerformNetworkTask() throws {
        networking.performNetworkTask(endpoint: AppAPI.professionals(whatValue: "medecin", whereValue: "paris"), type: SearchResult.self) { [weak self] (response) in
            self?.searchResult = response
            XCTAssertTrue(false == self?.searchResult?.search_results?.listings.isEmpty)
        }
    }

}
