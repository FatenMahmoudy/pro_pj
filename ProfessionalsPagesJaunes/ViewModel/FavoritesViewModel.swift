//
//  FavoritesViewModel.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import Foundation

class FavoritesViewModel {
    
    private var profossionals : [Professional]?
    
    public func getFavorites(completion: (() -> Void)?) {
        
        if let pros = professionalCache.object(forKey: "favorites") as? [Professional] {
            self.profossionals = pros
        }
        
        completion?()
    }
    
    public func cellViewModel(index: Int) -> FavoriteViewCellModel? {
        guard let profossionals = profossionals else { return nil }
        let professionalTableViewCellModel = FavoriteViewCellModel(professional: profossionals[index])
        return professionalTableViewCellModel
    }
    
//    public func selectedProfessional(index: Int) -> Professional? {
//        guard let professional = profossionals?[index] else {return nil}
//        return professional
//    }
    
    public var count: Int {
        return profossionals?.count ?? 0
    }
}
