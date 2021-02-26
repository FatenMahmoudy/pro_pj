//
//  Professional.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 25/02/2021.
//

import Foundation

struct Professional: Codable {
    let merchant_name: String
    let listing_id: String
    let inscriptions: [Infos]
}
