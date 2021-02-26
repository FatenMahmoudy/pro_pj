//
//  ProfessionalTableViewCell.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 25/02/2021.
//

import UIKit

class ProfessionalTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
    public var viewModel: ProfessionalViewCellModel? {
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
}
