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
    }

    private func configureItem() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }
}

