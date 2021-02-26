//
//  ProfessionalViewCellModel.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 25/02/2021.
//

import Foundation

class ProfessionalViewCellModel {
    
    private let professional: Professional
    
    init(professional: Professional) {
        self.professional = professional
    }
    
    var name: String {
        return professional.merchant_name
    }
    
    var address: String {
        return professional.inscriptions[0].address_street + " " + professional.inscriptions[0].address_city + ", " + professional.inscriptions[0].address_zipcode
    }
}
