//
//  EndpointType.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import Foundation

protocol EndpointType {

    var baseURL: URL { get }

    var path: String { get }

}
