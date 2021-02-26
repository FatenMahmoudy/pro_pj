//
//  FavoriteTableViewCell.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    weak var delegate: FavoriteTableViewCellDelegate?
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    public var viewModel: FavoriteViewCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            addressLabel.text = viewModel.address
            
            logoImageView.layer.borderWidth = 1.0
            logoImageView.layer.masksToBounds = false
            logoImageView.layer.cornerRadius = logoImageView.frame.size.height/2
            logoImageView.clipsToBounds = true
        }
    }
    
    @IBAction func removeFromFavorites(_ sender: Any) {
        
        guard let viewModel = viewModel else {
            return
        }
        if let delegate = delegate {
            delegate.removeProfessional(self, bookButtonTappedFor: viewModel.professional)
            viewModel.removeProfessionalFromFavorites()
        }
    }
}

protocol FavoriteTableViewCellDelegate: AnyObject {
  func removeProfessional(_ favoriteTableViewCell: FavoriteTableViewCell, bookButtonTappedFor professional: Professional)
}
