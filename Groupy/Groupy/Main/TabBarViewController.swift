//
//  TabBarViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 03/07/23.
//

import UIKit

class TabBarViewController: UITabBarController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var onboardingAppeared: Bool = false
    var educators: [Educator]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEducators()
        if educators?.count == 0 {
            showOnboarding()
        }
    }
    
    private func showOnboarding() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "OnboardingViewController")
        viewController.modalTransitionStyle = .coverVertical
        viewController.modalPresentationStyle = .pageSheet
        navigationController?.showDetailViewController(viewController, sender: true)
    }
    
    func fetchEducators() {
        do {
            // importante: declarar self.items se tudo isso estiver dentro de uma classe
            educators = try context.fetch(Educator.fetchRequest())
            
            // caso tenha uma table view, eh so descomentar as linhas abaixo para
            // renderiza-la novamente apos fazer o fetch de Users
            // DispatchQueue.main.async {
            //   self.tableView.reloadData()
            // }
        }
        catch {
            
        }
    }
}
