//
//  CriteriaViewController.swift
//  Groupy
//
//  Created by Clissia Bozzer Bovi on 26/06/23.
//

import UIKit

class CriteriaViewController: UIViewController {

    @IBOutlet weak var apagar: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Criteria"
    }
}
