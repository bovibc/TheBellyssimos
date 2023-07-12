//
//  ShareCodeViewController.swift
//  Groupy
//
//  Created by Luan Fazolin on 30/06/23.
//

import UIKit

class ShareCodeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.systemGray6

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        if isBeingDismissed {
            var presentingViewController = self.presentingViewController
            while presentingViewController != nil {
                presentingViewController?.dismiss(animated: true, completion: nil)
                presentingViewController = presentingViewController?.presentingViewController
            }
        }
    }
    
    @IBAction func maybeLatterTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)

        var presentingViewController = self.presentingViewController
        while presentingViewController != nil {
            presentingViewController?.dismiss(animated: true, completion: nil)
            presentingViewController = presentingViewController?.presentingViewController
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
