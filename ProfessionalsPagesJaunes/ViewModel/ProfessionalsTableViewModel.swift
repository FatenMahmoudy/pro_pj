//
//  ProfessionalsTableViewModel.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 25/02/2021.
//

import Foundation

class ProfessionalsTableViewModel {
    
    private let networking = Networking()
    private var searchResult : SearchResult?
    private var profossionals : Professionals?
    
    public func getAccessToken(completion: (() -> Void)?) {
        networking.getAccessToken(endpoint: AppAPI.accessToken, type: Token.self) { [weak self] (response) in
            print(response)
            completion?()
        }
    }
    
    public func getProfessionals(whatValue: String, whereValue: String,completion: (() -> Void)?) {
        networking.performNetworkTask(endpoint: AppAPI.professionals(whatValue: whatValue, whereValue: whereValue),
                                      type: SearchResult.self) { [weak self] (response) in
            self?.searchResult = response
            self?.profossionals = self?.searchResult?.search_results
            completion?()
        }
    }
    
    public func cellViewModel(index: Int) -> ProfessionalViewCellModel? {
        guard let searchResult = searchResult else { return nil }
        profossionals = searchResult.search_results
        
        guard let profossionals = profossionals else { return nil }
        let professionalTableViewCellModel = ProfessionalViewCellModel(professional: profossionals.listings[index])
        return professionalTableViewCellModel
    }
    
    public var count: Int {
        return profossionals?.listings.count ?? 0
    }
    
}
