//
//  CreateEducatorViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CreateEducatorViewController: UIViewController {

    // set core data context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var organizationField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.systemGray6

        // Do any additional setup after loading the view.
    }
    
    func validateFields() -> Bool {
        
        var validation = true
        
        if nameField.text == "" {
            let placeholderText = "Missing name"
            let placeholderColor = UIColor.red

            let attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            
            nameField.attributedPlaceholder = attributedPlaceholder
            validation = false
        }
        if organizationField.text == "" {
            let placeholderText = "Missing organization"
            let placeholderColor = UIColor.red

            let attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            
            organizationField.attributedPlaceholder = attributedPlaceholder
            validation = false
        }
        if emailField.text == "" {
            let placeholderText = "Missing email"
            let placeholderColor = UIColor.red

            let attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            
            emailField.attributedPlaceholder = attributedPlaceholder
            validation = false
        }
        if passwordField.text == "" {
            let placeholderText = "Missing password"
            let placeholderColor = UIColor.red

            let attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            
            passwordField.attributedPlaceholder = attributedPlaceholder
            validation = false
        }
        if confirmPasswordField.text == "" {
            let placeholderText = "Missing password confirmation"
            let placeholderColor = UIColor.red

            let attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
            
            confirmPasswordField.attributedPlaceholder = attributedPlaceholder
            validation = false
        }
        if passwordField.text != "" &&
           confirmPasswordField.text != "" &&
           passwordField.text != confirmPasswordField.text {
            // Create the action buttons for the alert.
            let defaultAction = UIAlertAction(title: "OK",
                                 style: .default) { (action) in
            }

            // Create and configure the alert controller.
            let alert = UIAlertController(title: "Password confirmation failed",
                  message: "Please, review the password and the password confirmation fields.",
                  preferredStyle: .alert)
            alert.addAction(defaultAction)

            self.present(alert, animated: true) {
               // The alert was presented
            }
            validation = false
        }
        
        return validation
    }
    
    func addEducator() {
        
        // instancia o objeto a ser adicionado no Core Data
        let newEducator = Educator(context: self.context)
        newEducator.name = nameField.text
        newEducator.password = passwordField.text
        newEducator.email = emailField.text
        newEducator.loggedIn = true
        newEducator.firstTime = false
        newEducator.id = Int64(Int.random(in: 1000...9999))
        
        // salva o objeto no Core Data
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        // faz um refetch dos dados sendo exibidos para atualizar
        // self.fetchUsers()
    }
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func createTapped(_ sender: UIButton) {
        if validateFields() {
            addEducator()
            self.dismiss(animated: true, completion: nil)

            var presentingViewController = self.presentingViewController
            while presentingViewController != nil {
                presentingViewController?.dismiss(animated: true, completion: nil)
                presentingViewController = presentingViewController?.presentingViewController
            }
        }
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
