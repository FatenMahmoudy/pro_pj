//
//  FavoriteViewCellModel.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import Foundation

class FavoriteViewCellModel {
    
    let professional: Professional
    
    init(professional: Professional) {
        self.professional = professional
    }
    
    var name: String {
        return professional.merchant_name
    }
    
    var address: String {
        return professional.inscriptions[0].address_street + " " + professional.inscriptions[0].address_city + ", " + professional.inscriptions[0].address_zipcode
    }
    
    public func removeProfessionalFromFavorites() {
        var storedProfessionals = [Professional]()
        if let pros = professionalCache.object(forKey: "favorites") as? [Professional] {
            storedProfessionals = pros
            
            if let pro = storedProfessionals.enumerated().first(where: {$0.element.listing_id == professional.listing_id}) {
                storedProfessionals.remove(at: pro.offset)
                professionalCache.removeObject(forKey: "favorites")
                professionalCache.setObject(storedProfessionals as AnyObject, forKey: "favorites")
                
                NotificationCenter.default.post(name: Notification.Name(rawValue: "removeCell"), object: nil, userInfo:nil)
            }
        }
    }
    
}
