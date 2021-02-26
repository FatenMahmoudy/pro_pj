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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        myActivityIndicator.center = view.center
        myActivityIndicator.hidesWhenStopped = false
        myActivityIndicator.startAnimating()
        
        self.view.addSubview(myActivityIndicator)
        
        print("what and where values \(whatOption) \(whereOption)")
        
        viewModel.getProfessionals(whatValue: self.whatOption ?? "", whereValue: self.whereOption ?? "") { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.myActivityIndicator.isHidden = true
                self?.myActivityIndicator.stopAnimating()
            }
        }

        tableView.register(UINib.init(nibName: "ProfessionalTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfessionalTableViewCell")
        tableView.separatorStyle = .none
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
