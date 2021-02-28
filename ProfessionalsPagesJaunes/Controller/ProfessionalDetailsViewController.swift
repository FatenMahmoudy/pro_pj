//
//  ProfessionalDetailsViewController.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import UIKit

class ProfessionalDetailsViewController: UIViewController {
    
    var professional: Professional?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addToFavoritesButton: UIButton!
    
    private var viewModel: ProfessionalDetailsViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            nameLabel.text = viewModel.name
            addressLabel.text = viewModel.address

            callButton.layer.borderWidth = 0
            callButton.layer.masksToBounds = false
            callButton.layer.cornerRadius = callButton.frame.size.height/2
            callButton.clipsToBounds = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.accessibilityIdentifier = "nameLabel"
        addressLabel.accessibilityIdentifier = "addressLabel"
        callButton.accessibilityIdentifier = "callButton"
        addToFavoritesButton.accessibilityIdentifier = "addToFavoritesButton"
        
        if let professional = professional {
            viewModel = ProfessionalDetailsViewModel(professional: professional)
        }
    }
    
    @IBAction func addProfessionalToFavorites(_ sender: Any) {
        if let vm = viewModel {
            vm.addProfessionalToFavorites()
            if vm.isFavorite {
                addToFavoritesButton.backgroundColor = .red
                addToFavoritesButton.setTitle("Remove from favorites", for: .normal)
            }
            else {
                addToFavoritesButton.backgroundColor = .yellow
                addToFavoritesButton.setTitle("Add to favorites", for: .normal)
            }
        }
    }
    
    @IBAction func callProfessional(_ sender: Any) {
        if let url = URL(string: "tel://0758875544") {
            UIApplication.shared.canOpenURL(url)
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

}
