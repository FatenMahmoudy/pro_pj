//
//  Token.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import Foundation

struct Token: Codable {
    let access_token: String?
    let token_type: String?
    let expires_in: Int
}
