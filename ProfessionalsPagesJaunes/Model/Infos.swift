//
//  Infos.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 25/02/2021.
//

import Foundation

struct Infos: Codable {
    let address_city: String
    let address_street: String
    let address_zipcode: String
    let contact_info: [Contacts]
}
