//
//  FavoritesViewController.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 26/02/2021.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let viewModel = FavoritesViewModel()
    var selectedProfessional: Professional?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.getFavorites),
                                               name: NSNotification.Name(rawValue: "removeCell"), object: nil)
        
        getFavorites()
        
        navigationController?.navigationBar.accessibilityIdentifier = "favoritesNavigationBar"
        tableView.register(UINib.init(nibName: "FavoriteTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoriteTableViewCell")
        tableView.separatorStyle = .none
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @objc func getFavorites() {
        viewModel.getFavorites() {
            [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
        }
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell",
                                                       for: indexPath) as? FavoriteTableViewCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedProfessional = viewModel.selectedProfessional(index: indexPath.row)
        performSegue(withIdentifier: "show_favorite_details", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionationViewController = segue.destination as? ProfessionalDetailsViewController {
            destionationViewController.professional = selectedProfessional
        }
    }

}

extension FavoritesViewController : FavoriteTableViewCellDelegate {
    
    func removeProfessional(_ favoriteTableViewCell: FavoriteTableViewCell, favoriteButtonTappedFor professional: Professional) {
        let alert = UIAlertController(title: "Deleted", message: "You have deleted the professional from favorites successfully", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }

}
