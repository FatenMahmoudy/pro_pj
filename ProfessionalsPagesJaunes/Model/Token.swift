//
//  Token.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import Foundation

// This Model serves only in case we get the access token dynamically
// using the function getAccessToken in Networking.swift
struct Token: Codable {
    let access_token: String?
    let token_type: String?
    let expires_in: Int
}
