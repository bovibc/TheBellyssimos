//
//  ChooseAccountViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class ChooseAccountViewController: UIViewController {

    var accountType: String = "none"

    @IBOutlet weak var studentButton: UIButton!
    @IBOutlet weak var educatorButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.systemGray6
        
        // buttons configuration
        studentButton.layer.borderWidth = 1.0
        studentButton.backgroundColor = UIColor.white
        studentButton.layer.cornerRadius = studentButton.frame.height/4
        studentButton.layer.borderColor = UIColor.systemGray3.cgColor
        
        educatorButton.layer.borderWidth = 1.0
        educatorButton.backgroundColor = UIColor.white
        educatorButton.layer.cornerRadius = educatorButton.frame.height/4
        educatorButton.layer.borderColor = UIColor.systemGray3.cgColor
        studentButton.setTitleColor(UIColor.systemBlue, for: .selected)
        educatorButton.setTitleColor(UIColor.systemBlue, for: .selected)



        title = "Choose account type"
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func studentButtonTapped(_ sender: UIButton) {
        studentButton.isSelected = true
        educatorButton.isSelected = false
        educatorButton.layer.borderColor = UIColor.systemGray3.cgColor
        studentButton.layer.borderColor = UIColor.systemBlue.cgColor
        accountType = "student"
    }
    

    @IBAction func educatorButtonTapped(_ sender: UIButton) {
        educatorButton.isSelected = true
        studentButton.isSelected = false
        studentButton.layer.borderColor = UIColor.systemGray3.cgColor
        educatorButton.layer.borderColor = UIColor.systemBlue.cgColor
        accountType = "educator"
    }

    
    @IBAction func backToLogin(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func continueTapped(_ sender: UIButton) {
        
        if accountType == "student" {
            let defaultAction = UIAlertAction(title: "OK",
                                 style: .default) { (action) in
            }

            // Create and configure the alert controller.
            let alert = UIAlertController(title: "Student account unavailable",
                  message: "We're sorry, but only the educator account is available for test on this build version.",
                  preferredStyle: .alert)
            alert.addAction(defaultAction)
                 
            self.present(alert, animated: true) {
               // The alert was presented
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
