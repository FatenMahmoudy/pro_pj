//
//  ProfessionalsViewController.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 25/02/2021.
//

import UIKit

class ProfessionalsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let viewModel = ProfessionalsTableViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    var myActivityIndicator: UIActivityIndicatorView!
    var whatOption: String?
    var whereOption: String?
    var selectedProfessional: Professional?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.startAnimating()
        
        self.view.addSubview(myActivityIndicator)
        
        viewModel.getToken() { [weak self] (response) in
            
            self?.viewModel.getProfessionals(accessToken: response ?? "", whatValue: self?.whatOption ?? "", whereValue: self?.whereOption ?? "") { [weak self] in
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                    self?.myActivityIndicator.isHidden = true
                    self?.myActivityIndicator.stopAnimating()
                }
            }
        }
        
        

        tableView.register(UINib.init(nibName: "ProfessionalTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfessionalTableViewCell")
        tableView.separatorStyle = .none
        tableView.accessibilityIdentifier = "searchTableView"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProfessionalTableViewCell",
                                                       for: indexPath) as? ProfessionalTableViewCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 153.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedProfessional = viewModel.selectedProfessional(index: indexPath.row)
        performSegue(withIdentifier: "show_details_segue", sender: self)
    }

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionationViewController = segue.destination as? ProfessionalDetailsViewController {
            destionationViewController.professional = selectedProfessional
        }
    }

}
