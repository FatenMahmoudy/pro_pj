//
//  Networking.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import Foundation

struct Networking {
    
    //Use this function to get the access token, add the app identifier as a value to the key "audience" in the body
    func getAccessToken<T: Codable>(endpoint: AppAPI, type: T.Type, completion: ((_ response: T) -> Void)?) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        guard let urlRequest = URL(string: urlString ?? "") else { return }
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
                
        let body = "[\"grant_type\" : \"client_credentials\",  \"client_id\" : \"X74hmmhP7o5OwSCCa1i6ZMUYOXMCun0O\", \"client_secret\" : \"Azx0XeGMjtuts7rG\", \"audience\" : \"\"]"
        
        let headers = [
            "Authorization": "Basic",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        
        var request = URLRequest(url: urlRequest)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        request.allHTTPHeaderFields = headers
        
        let session = URLSession(configuration: configuration)
        
        let urlSession = session.dataTask(with: request) { (data, urlResponse, error) in
            if let _ = error {
                return
            }
            guard let data = data else {
                return
            }
            print(data)
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }
        urlSession.resume()
    }

    func performNetworkTask<T: Codable>(endpoint: AppAPI,
                                        type: T.Type,
                                        completion: ((_ response: T) -> Void)?) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        
        guard let urlRequest = URL(string: urlString ?? "") else { return }
        
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .returnCacheDataElseLoad
        
        var request = URLRequest(url: urlRequest)
        request.addValue("Bearer hAvLktob77WAx96A8YZeNtLqLDTY", forHTTPHeaderField: "Authorization")

        let session = URLSession(configuration: configuration)

        let urlSession = session.dataTask(with: request) { (data, urlResponse, error) in
            if let err = error {
                print(err)
                return
            }
            guard let data = data else {
                return
            }
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded)
        }
        urlSession.resume()
    }
}
