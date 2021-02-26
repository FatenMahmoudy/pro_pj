//
//  HomeViewController.swift
//  ProfessionalsPagesJaunes
//
//  Created by Faten Mahmoudi on 24/02/2021.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var whatTextField: UITextField!
    @IBOutlet weak var whereTextField: UITextField!
    
    var whatOption: String?
    var whereOption: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hideKeyboardWhenTappedAround()
        
        navigationController?.navigationBar.accessibilityIdentifier = "homeNavigationBar"
        scrollView.accessibilityIdentifier = "homeScrollView"
        whatTextField.accessibilityIdentifier = "whatTextField"
        whereTextField.accessibilityIdentifier = "whereTextField"
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)

        whatTextField.delegate = self
        whereTextField.delegate = self
        scrollView.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.scrollView.frame.origin.y == 0 {
                self.scrollView.frame.origin.y -= 100
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.scrollView.frame.origin.y != 0 {
                self.scrollView.frame.origin.y += 100
            }
        }
    }
    
    @IBAction func search(_ sender: Any) {
        if let what = whatTextField.text, let whereO = whereTextField.text {

            if (what != "" && whereO != "") {
                self.whatOption = what.replacingOccurrences(of: " ", with: "")
                self.whereOption = whereO.replacingOccurrences(of: " ", with: "")
                performSegue(withIdentifier: "show_list_segue", sender: self)
            }
            else {
                showAlert()
            }
        }
        else {
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "OoPs", message: "Unvalid Parameter", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destionationViewController = segue.destination as? ProfessionalsViewController {
            destionationViewController.whatOption = self.whatOption
            destionationViewController.whereOption = self.whereOption
        }
    }
    

}

extension HomeViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(HomeViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
