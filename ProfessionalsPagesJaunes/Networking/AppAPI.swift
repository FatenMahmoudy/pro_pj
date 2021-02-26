//
//  AppAPI.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import Foundation

enum AppAPI {
    case accessToken
    case professionals(whatValue: String, whereValue: String)
}

extension AppAPI: EndpointType {
    var baseURL: URL {
        return URL(string: "https://api.pagesjaunes.fr")!
    }
    
    var path: String {
        switch self {
        case .accessToken:
            //https://api.pagesjaunes.fr/oauth/client_credential/accesstoken
        return "/oauth/client_credential/accesstoken"
        case .professionals(let whatValue, let whereValue):
            //"q" - Example = "/pros/search?q=je veux un restaurant à rennes
            //https://api.pagesjaunes.fr/v1/pros/search?what=medecin&where=tunis
            return "/v1/pros/search?what=\(whatValue)&where=\(whereValue)"
        default:
            return ""
        }
    }
}
