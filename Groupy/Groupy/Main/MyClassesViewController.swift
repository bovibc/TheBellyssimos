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
        self.parent?.title = "My Classes"
        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }
}

