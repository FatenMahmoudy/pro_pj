//
//  NavigationViewController.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import UIKit

class NavigationViewController: UINavigationController {

    var gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.barStyle = UIBarStyle.black
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barTintColor = UIColor(red: 70/255.0, green: 43/255.0, blue: 94/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationBar.isTranslucent = true

    }

}
