//
//  LoginViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.systemGray6

        title = "Login"
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "LoginFlow", bundle: nil)
        let chooseAccountView = storyboard.instantiateViewController(withIdentifier: "ChooseAccountViewController")
        self.present(chooseAccountView, animated: true)
    }
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
