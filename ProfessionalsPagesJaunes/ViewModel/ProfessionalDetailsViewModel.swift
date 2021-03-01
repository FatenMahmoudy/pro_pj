//
//  ProfessionalDetailsViewModel.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import Foundation

var professionalCache = NSCache<NSString, AnyObject>()

class ProfessionalDetailsViewModel {
    
    private let professional: Professional
    
    init(professional: Professional) {
        self.professional = professional
    }
    
    var name: String {
        return professional.merchant_name
    }
    
    var address: String {
        return professional.inscriptions[0].address_street + " " + professional.inscriptions[0].address_city + ", " + professional.inscriptions[0].address_zipcode
    }
    
    var phoneNumber: String {
        return professional.inscriptions[0].contact_info[0].contact_value
    }
    
    var isFavorite: Bool = false
    
    public func addProfessionalToFavorites() {
        var storedProfessionals = [Professional]()
        if let professionals = professionalCache.object(forKey: "favorites") as? [Professional] {
            storedProfessionals = professionals
            
            if let pro = storedProfessionals.enumerated().first(where: {$0.element.listing_id == professional.listing_id}) {
                storedProfessionals.remove(at: pro.offset)
                isFavorite = false
                professionalCache.removeObject(forKey: "favorites")
                professionalCache.setObject(storedProfessionals as AnyObject, forKey: "favorites")
            } else {
                storedProfessionals.append(professional)
                isFavorite = true
                professionalCache.setObject(storedProfessionals as AnyObject, forKey: "favorites")
            }
        } else {
            storedProfessionals.append(professional)
            isFavorite = true
            professionalCache.setObject(storedProfessionals as AnyObject, forKey: "favorites")
        }
    }
    
    public func checkIfFavorite() {
        if let professionals = professionalCache.object(forKey: "favorites") as? [Professional] {
            
            if professionals.enumerated().first(where: {$0.element.listing_id == professional.listing_id}) != nil {
                isFavorite = true
            } else {
                isFavorite = false
            }
        } else {
            isFavorite = false
        }
    }
}
