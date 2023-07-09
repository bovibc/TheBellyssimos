//
//  CreateProjectViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class CreateProjectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = false
        self.title = "Create project"

        self.view.backgroundColor = UIColor.systemGray6
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func criteriaPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
        let criteriaCustomization = storyboard.instantiateViewController(withIdentifier: "CriteriaCustomizationViewController" )
        self.navigationController?.show(criteriaCustomization, sender: true)
    }

    @IBAction func randomlyPressed(_ sender: UIButton) {
        // Create the action buttons for the alert.
        let defaultAction = UIAlertAction(title: "Form groups",
                             style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel",
                             style: .cancel) { (action) in
         // Respond to user selection of the action.
        }

        // Create and configure the alert controller.
        let alert = UIAlertController(title: "Form groups randomly",
              message: "You are about to form groups randomly for this project, without a specific criterion selected.",
              preferredStyle: .alert)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
             
        self.present(alert, animated: true) {
           // The alert was presented
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
