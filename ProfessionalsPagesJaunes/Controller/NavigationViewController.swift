//
//  NavigationViewController.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barStyle = UIBarStyle.black
        self.navigationBar.tintColor = .systemYellow
        self.navigationBar.barTintColor = UIColor(red: 8/255, green: 22/255, blue: 68/255, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

}
