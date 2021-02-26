//
//  Response.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import Foundation

struct Response {
    fileprivate var data: Data
    init(data: Data) {
        self.data = data
    }
}

extension Response {
    public func decode<T: Codable>(_ type: T.Type) -> T? {
        let jsonDecoder = JSONDecoder()
        do {
            let response = try jsonDecoder.decode(T.self, from: data)
            return response
        } catch let error {
            print("error in response")
            print(error)
            return nil
        }
    }
}
