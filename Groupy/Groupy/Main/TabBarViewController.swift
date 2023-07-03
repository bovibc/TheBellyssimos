//
//  TabBarViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 03/07/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    private var isFirstLogin: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        if isFirstLogin {
            isFirstLogin = false
            showOnboarding()
        }
    }
    
    private func showOnboarding() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "OnboardingViewController")
        let navigationController = UINavigationController(rootViewController: viewController)
        self.present(navigationController, animated: true, completion: nil)
    }
}
