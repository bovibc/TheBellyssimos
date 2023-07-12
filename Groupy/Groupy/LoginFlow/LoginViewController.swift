//
//  LoginViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passowordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupKeyboard()
        self.view.backgroundColor = UIColor.systemGray6
        self.title = "Login"
        emailTextField.delegate = self
        passowordTextField.delegate = self
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "LoginFlow", bundle: nil)
        let chooseAccountView = storyboard.instantiateViewController(withIdentifier: "ChooseAccountViewController")
        self.present(chooseAccountView, animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupKeyboard() {
        let toolbar = UIToolbar()
        let space =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                         target: self, action: #selector(hideKeyboardAction))
        toolbar.setItems([space,doneButton], animated: true)
        toolbar.sizeToFit()
        
        emailTextField.inputAccessoryView = toolbar
        passowordTextField.inputAccessoryView = toolbar
    }
    
    @objc func hideKeyboardAction() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboardAction()
        return false
    }
}
