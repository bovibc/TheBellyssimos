//
//  ViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 26/06/23.
//

import UIKit

class MyClassesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItem()
    }

    
    private func configureItem() {
        self.navigationController?.navigationBar.topItem?.title = "My Classes"
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(
                systemItem: .add,
                primaryAction: nil,
                menu: createMenu()
            )
        }
        
        func createMenu() -> UIMenu {
            let educatorStoryboard = UIStoryboard(name: "EducatorFlow", bundle: nil)
    
            var menuItems: [UIAction] {
                return [
                    UIAction(title: "Join class", handler: { _ in
                        let joinClassView = educatorStoryboard.instantiateViewController(withIdentifier: "EducatorJoinClass" )
                        self.navigationController?.present(joinClassView, animated: true)
                    }),
                    UIAction(title: "Create class", handler: { _ in
                        let createClassView = educatorStoryboard.instantiateViewController(withIdentifier: "CreateClass")
                        self.navigationController?.present(createClassView, animated: true)
                    }),
                ]
            }
            
            return UIMenu(title: "", image: nil, identifier: nil, options: [], children: menuItems)
        }
}

